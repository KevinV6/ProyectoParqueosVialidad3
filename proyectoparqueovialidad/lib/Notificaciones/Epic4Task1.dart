import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

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
                      SizedBox(
                        height: 10,
                      ),
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

  buildCard2() {
    final double _borderRadius = 24;
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
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(_borderRadius),
                                    gradient: LinearGradient(
                                        //color del card
                                        colors: [Color(0xffBFD7ED)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff60A3D9),
                                        blurRadius: 12,
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  top: 0,
                                  child: CustomPaint(
                                    size: Size(100, 150),
                                    painter: CustonCardShapePain(_borderRadius,
                                        Color(0xffBFD7ED), Color(0xffBFD7ED)),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              (lists[index]["SiteStreet"]),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Flexible(
                                                    child: Icon(
                                                  Icons.location_on,
                                                  color: Color(0xff212871),
                                                )),
                                                // Icon(Icons.location_on, color: Colors.white),
                                                SizedBox(width: 5),
                                                Flexible(
                                                  child: Text(
                                                    (lists[index]["Name"]),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff212871),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Fecha: " +
                                                  (lists[index]
                                                      ["ProgrammingDate"]),
                                              style: TextStyle(
                                                  color: Color(0xff212871),
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 10),
                                            Flexible(
                                              child: Text(
                                                "Descripcion: " +
                                                    lists[index]["Description"],
                                                style: TextStyle(
                                                    color: Color(0xff212871),
                                                    fontFamily: 'Arial',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Duracion',
                                              style: TextStyle(
                                                  color: Color(0xff212871),
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              lists[index]["StartTime"] +
                                                  " \n\t A\n" +
                                                  lists[index]["EndTime"],
                                              style: TextStyle(
                                                  color: Color(0xff212871),
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}

class CustonCardShapePain extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustonCardShapePain(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 50 - radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
