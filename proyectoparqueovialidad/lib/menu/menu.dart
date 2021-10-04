import 'package:flutter/material.dart';
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
                        image:  AssetImage('assets/image/Menu/header.jpg'))),
                child: Column(
                  children: [
                    Expanded(child:Image.asset('assets/image/Menu/logo.png'),
                    ),
                    Positioned(
                      bottom: 12.0,
                      left: 16.0,
                      child: Text("Card Drop",
                        style: TextStyle (
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.info_outline),
              title: Text('Sobre Nosotros'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_circle_rounded),
              title: Text('Iniciar Sesion'),
            ),
            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text('Cardrop 2021'),
              ),
            ),
          ],
        ),
      ),
    );


  }
}