import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nosotros', style: TextStyle(color: Colors.yellow),),
        backgroundColor: Colors.indigo,

      ),
      body: Form(
          child: Container(
            child: Column(children: <Widget> [Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 93),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 0, left: 20, right: 400, bottom: 0),
                    child: Text("Esta Aplicacion esta hecha con la finalidad de saber"
                                 " que calles y parqueos estan disponibles, ya que la "
                                 " aplicacion cuenta con varias opciones que le permitira "
                                 " usar un mapa que le mostrara toda la ciudad y podra "
                                 " ver mas facil mente que parqueos estan disponibles "
                                 " o que calles estan bloqueadas, esta aplicacion "
                                 " tambien cuenta con un sistema de notificaciones que"
                                 " avisa que parqueos ya no estan disponibles y si quiere"
                                 " tener mas opciones puede registrarse en la aplicacion."),),

                  Spacer( flex: 1,),
                  Container(
                    padding: EdgeInsets.only(
                        top: 0, left: 0, right: 550, bottom: 0),
                    child: Text("Para mas informacion revise nuestras redes sociales :"),),
                  Spacer( flex: 1,),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    buttonColor: Colors.indigo,
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.amber,
                      child: Text("Volver"),
                    ),
                  ),
                ],
              ),
            )
            ],
            ),)
      ),
    );
  }
}