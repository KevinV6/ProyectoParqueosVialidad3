import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


void main() {
  runApp(Notificaciones());
}

class Notificaciones extends StatelessWidget {

  @override
  static String id = "notificaciones_page";
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHome(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _NotificacionesState createState() => _NotificacionesState();
}
class _NotificacionesState extends State<MyHome> {
  final dbRef = FirebaseDatabase.instance.reference().child("Streets");
  List<Map<dynamic, dynamic>> lists = [];


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

  buildCard2()  {
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
