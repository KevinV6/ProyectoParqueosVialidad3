import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/RegisterComplete/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyectoparqueovialidad/Registro/Epic5task1.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "REGISTRO COMPLETADO",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          SvgPicture.asset(
            "assets/image/RegisterComplete/RegisterComplete.svg",
            height: size.height * 0.45,
          ),
          Container(
            width: size.width * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Color.fromRGBO(33, 40, 113, 1),
                onPressed: () {
                  Navigator.pushNamed(context, Login.id);
                },
                child: Text("TERMINAR",
                  style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

