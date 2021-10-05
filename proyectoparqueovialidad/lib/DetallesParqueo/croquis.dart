import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Croquis Prado',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text ('Croquis'),
        ),
        body: Container(
          child: Image.asset('images/croquis.png'),
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(color: Colors.black26, width: 4),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }
}

