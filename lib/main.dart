import 'package:flutter/material.dart';

final TextStyle estilonormal = TextStyle(fontSize: 20.0, color: Colors.black);
final TextStyle estilotitulo = TextStyle(fontSize: 30.0, color: Colors.orange);
final TextStyle estilotitulo2 = TextStyle(fontSize: 30.0, color: Colors.blueGrey);
final TextStyle estilocontador = TextStyle(fontSize: 150.0, color: Colors.orange);

final TextStyle estiloAlertaNormal = TextStyle(fontSize: 20.0, color: Colors.blue);
final TextStyle estiloAlertaadvertencia = TextStyle(fontSize: 20.0, color: Colors.orangeAccent);
final TextStyle estiloAlertaPeligro = TextStyle(fontSize: 20.0, color: Colors.red);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador Bugs Diego',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Contador Bugs Diego'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _porcentaje = 0;
  int capacidad = 30;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: (capacidad / 3).round().toString()),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Numero de Desarrolladores"),
              onSubmitted: (String numeroDesarrolladores) async {
                capacidad = int.tryParse(numeroDesarrolladores) * 3;
                setState(() {
                });
              },
            ),
            Text(
              "Un programador procesara \nmaximo 3 bugs",
              style: estilonormal,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text("Limite de " + capacidad.toString() + " bugs",
                style: _porcentaje <= 30.0
                    ? estiloAlertaNormal
                    : _porcentaje <= 75
                    ? estiloAlertaadvertencia
                    : estiloAlertaPeligro),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              "% de errores en proceso " +
                  "${_porcentaje.toStringAsFixed(2)}" +
                  " %",
              style: estilonormal,
            ),
            Text(
              "${_counter}",
              style: estilocontador,
            ),
            Icon(
              _counter == 1
                  ? Icons.adjust
                  : _counter == 0
                  ? Icons.check
                  : _porcentaje <= 75
                  ? Icons.bug_report_sharp
                  : Icons.dangerous,
              size: 50.0,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => _incrementar(),
              child: Icon(Icons.plus_one_outlined),
              backgroundColor: Colors.teal,
              tooltip: 'Aumentar',
            ),
            FloatingActionButton(
              onPressed: () => _decrementar(),
              child: Icon(Icons.exposure_minus_1),
              backgroundColor: Colors.deepOrangeAccent,
              tooltip: 'Disminuir',
            ),
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //funcion contardor
  void _incrementar() {
    setState(() {
      if (_counter < capacidad) {
        _counter = _counter + 1;
        _porcentaje = (_counter * 100) / capacidad;
      }
    });
  }

  void _decrementar() {
    setState(() {
      if (_counter > 0) {
        _counter = _counter - 1;
        _porcentaje = (_counter * 100) / capacidad;
      }
    });
  }

}
