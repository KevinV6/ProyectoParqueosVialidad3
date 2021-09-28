import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Notificaciones',
                        style: TextStyle(
                          color: Color(0xff212871),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox (height: 10, ),
                      buildCard1(),
                      SizedBox(height: 30,),
                      buildCard2(),
                      SizedBox(height: 10,),
                      buildCard3(),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCard1()  {
    return Card(
      child: Column(
        children: <Widget>[

          ListTile(

            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Direccion'),
            subtitle: Text(
                'Ver detalles(motivo del bloqueo de la calle).'),
            leading: Icon(Icons.notification_important),

          ),

        ],
      ),
      color: Color(0xfff4b405),);
  }

  buildCard2() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Direccion'),
            subtitle: Text(
                'Ver detalles(motivo del bloqueo de la calle).'),

            leading: Icon(Icons.notification_important),
          ),

        ],
      ),
      color: Color(0xfff4b405),);
  }

  buildCard3() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Direccion'),
            subtitle: Text(
                'Ver detalles(motivo del bloqueo de la calle).'),
            leading: Icon(Icons.notification_important),
          ),

        ],
      ),
      color: Color(0xfff4b405),);
  }

}