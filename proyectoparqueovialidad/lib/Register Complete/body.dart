import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyectovialidad/Register%20Complete/background.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              "../assets/image/registerComplete/RegisterComplete.svg",
              height: size.height * 0.45,
          ),
          Container(
            width: size.width * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Color.fromRGBO(33, 40, 113, 1),
                onPressed: () {},
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

