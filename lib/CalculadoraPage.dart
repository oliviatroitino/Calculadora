// La clase que representa la pantalla de la calculadora

import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculadoraState();
  }
}

class CalculadoraState extends State<CalculadoraPage> {
  double resultado = 0;
  String? ultimaOperacion;
  bool resultadoCalculado = false;
  String pantalla = '';

  void presionarBoton(String valBoton) {
    setState(() {
      if(pantalla == "Error" || ultimaOperacion == '='){
       pantalla = '';
      }
      if(valBoton == 'AC'){
        ultimaOperacion = '';
        pantalla = '';
      } else if(valBoton == '=') {
        try {
          ultimaOperacion = "=";
          pantalla = evaluarExpresion(pantalla);
        } catch (error) {
          pantalla = "Error";
        }
      } else {
        ultimaOperacion = '';
        pantalla += valBoton;
      }
    });
  }

  String evaluarExpresion(String expresion) {
    var operacion;
    List<String> operadores = ['+', '-', 'x', '/'];
    String? operador;

    for (var op in operadores) {
      if (expresion.contains(op)) {
        if (operador != null) {
          return "Error";
        }
        operador = op;
      }
    }
    print(operador);
    if(operador == null) return "Error";

    operacion = expresion.split(operador!);
    if (operacion.length != 2) return "Error";
    double operando1 = double.parse(operacion[0]);
    double operando2 = double.parse(operacion[1]);

    switch (operador) {
      case '+':
        return (operando1 + operando2).toString();
      case '-':
        return (operando1 - operando2).toString();
      case 'x':
        return (operando1 * operando2).toString();
      case '/':
        if(operando2 != 0){
          return (operando1 / operando2).toString();
        } else {
          return "Error";
        }
    }
    return "Error";
  }

  Widget crearBoton(String texto) {
    return ElevatedButton(
      onPressed: () => presionarBoton(texto),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: StadiumBorder(),
      ),
      child: Text(texto, style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora APP")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    pantalla,
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        crearBoton('7'), crearBoton('8'), crearBoton('9'), crearBoton('/'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        crearBoton('4'), crearBoton('5'), crearBoton('6'), crearBoton('x'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        crearBoton('1'), crearBoton('2'), crearBoton('3'), crearBoton('+'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        crearBoton('0'), crearBoton('AC'), crearBoton('='), crearBoton('-'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}