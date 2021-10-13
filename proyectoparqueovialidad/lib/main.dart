
import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
import 'package:proyectoparqueovialidad/BotonNavegacion/boton.dart';
import 'package:proyectoparqueovialidad/menu/menu.dart';
import 'package:proyectoparqueovialidad/MapaHome/mapahome.dart';
import 'package:proyectoparqueovialidad/SobreNosotros/About.dart';
import 'package:proyectoparqueovialidad/Registro/Epic5task1.dart';
import 'package:proyectoparqueovialidad/Registro/registration.dart';
import 'package:proyectoparqueovialidad/RegisterComplete/registercomplete.dart';
import 'package:proyectoparqueovialidad/Bienvenida/onboarding.dart';
import 'package:proyectoparqueovialidad/Notificaciones/Epic4Task1.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal cliente',

      routes: {
        //Sobre Nosotros
        MyStatefulWidget.id: (context) => MyStatefulWidget(),
        //Registro-Epic5task1
        Login.id: (context) => Login(),
        //Registro-registration
        Registration.id: (context) => Registration(),
        //RegisterComplete
        RegisterComplete.id: (context) => RegisterComplete(),

        Notificaciones.id: (context) => Notificaciones(),

        MyHomePage.id: (context) => MyHomePage(),
      },

      home: new Onboarding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);
  static String id = "incio_page";


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text("Menu principal cliente "),
        actions: [
          IconButton( //Boton de buscador
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BuscadorWP());
            },
          )
        ],
      ),

      //Navigation Bar
      bottomNavigationBar: Boton(),

    );
  }
}

