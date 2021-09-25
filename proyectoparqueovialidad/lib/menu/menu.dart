import 'package:flutter/material.dart';
class MenuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Container(
      child: ListTileTheme(

        textColor: Colors.amber,
        iconColor: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/image/cardropMenu.png', width: 10, height: 10,
              ),
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
    ),);


  }
}