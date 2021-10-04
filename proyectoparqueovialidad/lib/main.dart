
import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
import 'package:proyectoparqueovialidad/menu/menu.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal cliente',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text(""),
        actions: [
          IconButton( //Boton de buscador
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BuscadorWP());
            },
          )
        ],
      ),

    );
  }
}


