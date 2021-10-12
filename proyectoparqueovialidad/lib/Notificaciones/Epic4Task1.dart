import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD:proyectoparqueovialidad/lib/Notificaciones/Epic4Task1.dart
import 'package:proyectoparqueovialidad/menu/menu.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
>>>>>>> 6c011cb9d2e39c21880025048f19f6a290b204bd:proyectoparqueovialidad/lib/Epic4Task1.dart


class Notificaciones extends StatefulWidget {
  static String id = "notificaciones_page";

  @override
  _NotificacionesState createState() => _NotificacionesState();
}

<<<<<<< HEAD:proyectoparqueovialidad/lib/Notificaciones/Epic4Task1.dart
class _NotificacionesState extends State<Notificaciones> {
=======
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  final dbRef = FirebaseDatabase.instance.reference().child("Streets");
  List<Map<dynamic, dynamic>> lists = [];
>>>>>>> 6c011cb9d2e39c21880025048f19f6a290b204bd:proyectoparqueovialidad/lib/Epic4Task1.dart


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text(""),
        actions: [
          IconButton(    //Boton de buscador
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BuscadorWP());
            },
          )
        ],
      ),

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
<<<<<<< HEAD:proyectoparqueovialidad/lib/Notificaciones/Epic4Task1.dart
                      SizedBox(height: 10,),
                      buildCard1(),
                      SizedBox(height: 30,),
=======
                      SizedBox (height: 10, ),
>>>>>>> 6c011cb9d2e39c21880025048f19f6a290b204bd:proyectoparqueovialidad/lib/Epic4Task1.dart
                      buildCard2(),

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

<<<<<<< HEAD:proyectoparqueovialidad/lib/Notificaciones/Epic4Task1.dart
  buildCard1() {
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
=======
  buildCard2()  {
>>>>>>> 6c011cb9d2e39c21880025048f19f6a290b204bd:proyectoparqueovialidad/lib/Epic4Task1.dart
    return Card(
      child: Column(
        children: <Widget>[

          FutureBuilder(
              future: dbRef.once(),
              builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (snapshot.hasData) {
                  lists.clear();
                  Map<dynamic, dynamic> values = snapshot.data!.value;
                  values.forEach((key, values) {
                    lists.add(values);
                  });
                  return new ListView.builder(
                      shrinkWrap: true,
                      itemCount: lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        var now = new DateTime.now();
                        return Card(
                          color: Color(0xfff4b405),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.notification_important),
                                title: Transform.translate(
                                  offset: Offset(0, 0),
                                  child: Text('Calles Bloqueadas'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: Text(lists[index]["Name"]),),
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 0, 25, 0),
                                child: Text("Descripcion: " +lists[index]["Description"]),),
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 0, 25, 0),
                                child: Text("Fecha Actual: " + now.toString()),),
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: Text("Desde las: " +lists[index]["StartTime"]),),
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: Text("Hasta: " +lists[index]["EndTime"]),),
                            ],
                          ),
                        );
                      });
                }
                return CircularProgressIndicator();
              })
        ],
      ),
      color: Color(0xFFFFFFFF),);
  }
}
