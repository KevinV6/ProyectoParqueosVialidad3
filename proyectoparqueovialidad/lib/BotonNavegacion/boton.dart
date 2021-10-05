import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/rutas/rutas.dart';
import 'package:proyectoparqueovialidad/Notificaciones/Epic4Task1.dart';
import 'package:proyectoparqueovialidad/MapaHome/mapahome.dart';


class Boton extends StatefulWidget {

  @override
  _BotonState createState() => _BotonState();
}

class _BotonState extends State<Boton> {


  PageController _pageController = PageController();
  List <Widget> _screens = [
    MenuPrinci(),Notificaciones(),Rutas()
  ];

  int _selectIndex = 0;

  void _onPageChanged (int index){
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped (int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),

      //Navigation Bar
      bottomNavigationBar: BottomNavigationBar (
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp,
              color: _selectIndex ==0 ? Colors.blue: Colors.grey,
            ),
            title: Text( "Home",
              style: TextStyle(
                color: _selectIndex ==0 ? Colors.blue: Colors.grey,
              ),
            ),
          ),


          BottomNavigationBarItem(
            icon: Icon(  Icons.add_alert_rounded,
              color: _selectIndex ==1 ? Colors.blue: Colors.grey,
            ),
            title: Text( "Notificaciones",
              style: TextStyle(
                color: _selectIndex ==1 ? Colors.blue: Colors.grey,
              ),
            ),
          ),



          BottomNavigationBarItem(
            icon: Icon(Icons.map,
              color: _selectIndex ==2 ? Colors.blue: Colors.grey,
            ),
            title: Text( "Mapa(rutas)",
              style: TextStyle(
                color: _selectIndex ==2 ? Colors.blue: Colors.grey,
              ),
            ),
          ),

        ],
      ),
      //body: pages[_currentIndex]
    );
  }

}
