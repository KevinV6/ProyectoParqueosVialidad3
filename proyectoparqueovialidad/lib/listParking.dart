import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ListParking(),
    );
  }
}
class ListParking extends StatefulWidget {

  @override
  _ListParkingState createState() => _ListParkingState();
}

class _ListParkingState extends State<ListParking> {
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
                    horizontal:20,
                    vertical: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Nombre del parqueo',
                        style: TextStyle(
                          color: Color(0xff212871),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      buildRate(),
                      SizedBox(height: 30,),
                      buildPhotoParking(),
                      SizedBox(height: 10,),
                      buildDescriptionParking(),
                      SizedBox(height: 50,),
                      buildSeeLocation(),
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

  buildRate() {
    return Card(
     child: Column(
       children: <Widget>[
         ListTile(
           leading: Icon(Icons.attach_money,color: Color(0xff212871),),
           title: Text(
               'Tarifas',
             style: TextStyle(
               color: Color(0xff212871),
               fontSize: 16,
               fontWeight: FontWeight.bold
             ),
           ),
           subtitle: Text(
             'Decripcion de la tarifa del sitio correspondiente'
           ),
         )
       ],
     ),
    );
  }

  buildPhotoParking() {
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/6/6d/Tel_Aviv_parking_lot.jpg'))
        ],
      ),
    );
  }

  buildDescriptionParking() {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            'Es el detalle o descripcion del lugar'
          )
        ],
      ),
    );
  }

  buildSeeLocation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Color(0xff212871),
        onPressed: () {  },
        child: Text(
          'Ver',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
