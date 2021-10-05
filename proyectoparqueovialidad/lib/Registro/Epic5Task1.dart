import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyectoparqueovialidad/Registro/registration.dart';

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
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  static String id = "iniciarsesion_page";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(33),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Iniciar Sesion',
                        style: TextStyle(
                            color: Color(0xff212871),
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 50,),
                      buildEmail(),
                      SizedBox(height: 50,),
                      buildPassword(),
                      SizedBox(height: 50,),
                      buildTextForgotPassBtn(),
                      buildForgotPassBtn(),
                      SizedBox(height: 50,),
                      buildLoginBtn(),

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

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre de usuario',
          style: TextStyle(
              color: Color(0xff212871),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            //color: Colors.white,
              color: Color(0xfff4b405),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              //color: Colors.black87
                color: Color(0xff212871)
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_box,
                  //color: Color(0xfff4b405),
                  color: Colors.white,
                ),
                hintText: 'Nombre de usuario',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildTextForgotPassBtn() {
    return Container(
      alignment: Alignment.center,

      child: Text(
        '¿No tienes una cuenta?',
        style: TextStyle(
            color: Color(0xff212871),
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.center,

      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, Registration.id);
        },
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Regístrate',
          style: TextStyle(
            color: Color(0xff212871),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: TextStyle(
              color: Color(0xff212871),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            //color: Colors.white,
              color: Color(0xfff4b405),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              //color: Colors.black87
              color: Color(0xff212871),
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.password,
                  //color: Color(0xfff4b405),
                  color: Colors.white,
                ),
                hintText: 'Contraseña',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {},
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Color(0xff212871),
        child: Text(
          'Iniciar Sesion',
          style: TextStyle(
              color: Color(0xfff4b405),
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


}
