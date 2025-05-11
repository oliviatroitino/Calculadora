// La clase que representa la pantalla de la calculadora

import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculadoraState();
  }
}

class CalculadoraState extends State<CalculadoraPage> {
  int resultado = 0;
  String operacion = '+'; // operación por defecto
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora APP")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Por favor introduce los operandos que quieres utilizar: "),
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Introduce Operando 1",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 12.0, right: 12.0)),
                  Expanded(
                    child: TextField(
                      controller: controller2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Introduce Operando 2",
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton( // Suma
                    onPressed: () {
                      setState(() {
                        operacion = '+';
                      });
                    },
                    child: Text('+')
                  ),
                  ElevatedButton( // Resta
                    onPressed: () {
                      setState(() {
                        operacion = '-';
                    });
                  }, child: Text('-')
                  ),
                  ElevatedButton( // Multiplicación
                      onPressed: () {
                        setState(() {
                          operacion = '*';
                        });
                      }, child: Text('*')
                  ),
                  ElevatedButton( // División
                      onPressed: () {
                        setState(() {
                          operacion = '/';
                        });
                      }, child: Text('/')
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 24)),
              ElevatedButton(onPressed: () {
                // Capturar los operandos
                int operando1 = 0;
                int operando2 = 0;
                try {
                  operando1 = int.parse(controller1.text);
                  operando2 = int.parse(controller2.text);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: Deben haber dos números para calcular el resultado."))
                  );
                  return;
                }

                setState(() {
                    switch (operacion) {
                      case '+':
                        resultado = operando1 + operando2;
                        break;
                      case '-':
                        resultado = operando1 - operando2;
                        break;
                      case '*':
                        resultado = operando1 * operando2;
                        break;
                      case '/':
                        if(operando2 != 0){
                          resultado = operando1 ~/ operando2;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: No se puede dividir por cero."))
                          );
                        }
                    }
                });
              }, child: Text('Calcular')),
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Text("El resultado final es: $resultado")
            ],
          ),
        ),
      ),
    );
  }
}