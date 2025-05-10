import 'package:flutter/material.dart';
import 'CalculadoraPage.dart';

void main() {
  runApp(const MyApp()); // no se podría poner MyApp(12) porque {super.key} es nominal
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // super.key es de tipo no obligatorio (si no diría required)
  //const MyApp({super.key, var dato}); // no se puede, hay un constructor primario y nominales, este no es nominal
  //const MyApp.conDato({super.key, var dato}) // asi si se puede

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: CalculadoraPage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold es la estructura general de la aplicación
      /* En este caso:
      * AppBar
      * Body
      * FAB */
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter', // posicional
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}