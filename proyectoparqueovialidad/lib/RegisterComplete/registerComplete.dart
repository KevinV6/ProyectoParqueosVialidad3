import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/RegisterComplete/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro Completado',
      theme: ThemeData(
        primaryColor: Color(0xFF212871),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: RegisterComplete(),
    );
  }
}

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({Key? key}) : super(key: key);

  static String id = "registrocompleto_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }
}
