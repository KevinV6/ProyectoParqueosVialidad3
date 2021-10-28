import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/MapaHome/mapahome.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyectoparqueovialidad/main.dart';


void main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Hola sobre",
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  static String id = "sobrenosotros_page";

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  _launchURL(String value) async {
    const url = 'https://www.facebook.com/gamcochabamba';
    const url2 = 'https://www.cochabamba.bo/';
    const url3 = 'https://twitter.com/gam_cochabamba';

    if (value == 'facebook') {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (value == 'pagina') {
      if (await canLaunch(url2)) {
        await launch(url2);
      } else {
        throw 'Could not launch $url2';
      }
    } else if (value == 'twitter') {
      if (await canLaunch(url3)) {
        await launch(url3);
      } else {
        throw 'Could not launch $url3';
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Card Drop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Alcaldia Cochabamba',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.airport_shuttle_rounded,
            color: Colors.red[500],
          ),

        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget textSection = Container(
      padding: EdgeInsets.only( top: 0, left: 15, right: 2, bottom: 0),
      child: Text("Esta Aplicacion esta hecha con la finalidad de saber"
          " que calles y parqueos estan disponibles, ya que la "
          " aplicacion cuenta con varias opciones que le permitira "
          " usar un mapa que le mostrara toda la ciudad y podra "
          " ver mas facil mente que parqueos estan disponibles "
          " o que calles estan bloqueadas, esta aplicacion "
          " tambien cuenta con un sistema de notificaciones que"
          " avisa que parqueos ya no estan disponibles y si quiere"
          " tener mas opciones puede registrarse en la aplicacion."
      ),
    );
    Widget textSection1 = Container(
      padding: EdgeInsets.only( top: 0, left: 15, right: 2, bottom: 0),
      child: Text(""),
    );
    Widget textSection2 = Container(
      padding: EdgeInsets.only( top: 0, left: 15, right: 2, bottom: 0),
      child: Text("Para mas informacion revise nuestras redes sociales :"
      ),
    );
    Widget textSection3 = Container(
      padding: EdgeInsets.only( top: 0, left: 2, right: 2, bottom: 0),
      child: Text(""),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          IconButton( icon: Image.asset("assets/image/SocialButton/facebook.png"), iconSize: 55,
            onPressed: (){
              _launchURL('facebook');
            },
          ),
          IconButton( icon: Image.asset("assets/image/SocialButton/pagina.png"),iconSize: 61,
            onPressed: (){
              _launchURL('pagina');
            },
          ),
          IconButton( icon: Image.asset("assets/image/SocialButton/twitter.png"),iconSize: 55,
            onPressed: ()  {
              _launchURL('twitter');
            },
          )
        ],
      ),
    );

    Widget buttonSectio2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonTheme(
            minWidth: 50.0,
            height: 30.0,
            buttonColor: Colors.blueGrey,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new MenuPrinci(),
                  ),
                );
              },
              textColor: Colors.amber,
              child: Text("Volver"),
            ),
          ),
        ],
      ),

    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre nosotros',textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,

        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/image/SobreNosotros/parqueo.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
            textSection1,
            textSection2,
            textSection3,
            buttonSection,
            buttonSectio2,

          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );


  }
}












