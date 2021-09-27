import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ParqueosViladidad'),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: SizedBox(
          width: double.infinity,

          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber.shade600,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                RaisedButton.icon( //valeria este es tu boton
                  onPressed: (){

                  },
                  icon: Icon(Icons.format_list_bulleted),
                  label: Text(''),
                  color: Colors.amber.shade600,
                ),
                SizedBox(width: 180,
                ),
                RaisedButton.icon( // brayan este es tu boton

                  onPressed: (){

                  },
                  icon: Icon(Icons.search),
                  label: Text(''),
                  color: Colors.amber.shade600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}