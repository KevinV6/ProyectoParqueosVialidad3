import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/SobreNosotros/About.dart';
import 'package:proyectoparqueovialidad/Registro/Epic5task1.dart';



class MenuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        textColor: Colors.black,
        iconColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:  AssetImage('assets/image/Menu/header3.png')),
                ),
                child: Column(
                ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new MyStatefulWidget(),
                  ),
                );

              },
              leading: Icon(Icons.info_outline),
              title: Text('Sobre Nosotros'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new Login(),
                  ),
                );

              },
              leading: Icon(Icons.account_circle_rounded),
              title: Text('Iniciar Sesion'),
            ),
          ],
        ),
      ),
    );


  }
}