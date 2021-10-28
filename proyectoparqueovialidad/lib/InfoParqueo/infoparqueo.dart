import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
import 'package:proyectoparqueovialidad/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoparqueovialidad/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:animated_flip_card/animated_flip_card.dart';
import 'package:flip_card/flip_card.dart';

class InfoParqueo extends StatefulWidget {
  static String id = "info_pages";

  final DocumentSnapshot idfon;

  InfoParqueo({Key? key, required this.idfon}) : super(key: key);

  @override
  _InfoParqueoState createState() => _InfoParqueoState();
}

class _InfoParqueoState extends State<InfoParqueo> {
  //late LocationUnid locationUnid;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  CollectionReference _products =
      FirebaseFirestore.instance.collection('Locations');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['Name'];
      _priceController.text = documentSnapshot['price'].toString();
      _descripcionController.text = documentSnapshot['descripcion'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: MenuLateral(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: Colors.blue.shade700,
              title: Text(""),
              actions: [
                IconButton(
                  //Boton de buscador
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: BuscadorWP());
                  },
                )
              ],
            ),
          ),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.idfon['Name'],
                            style: TextStyle(
                              color: Color(0xff212871),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          buildDescription(),
                          SizedBox(
                            height: 10,
                          ),
                          builParkingSpaces(),
                          SizedBox(
                            height: 10,
                          ),
                          buildStreet(),
                          SizedBox(
                            height: 10,
                          ),
                          buildCardPhoto(),
                          SizedBox(
                            height: 10,
                          ),
                          buildPrice(),
                          SizedBox(
                            height: 10,
                          ),
                          buildSeeLocation(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  buildDescription() {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: Color(0xffBFD7ED),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.book,
                color: Color(0xff212871),
              ),
              title: Text(
                'Descripcion',
                style: TextStyle(
                    color: Color(0xff212871),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.idfon['Description']),
            )
          ],
        ),
      ),
    );
  }

  builParkingSpaces() {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: Color(0xffBFD7ED),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.directions_car_filled_outlined,
                color: Color(0xff212871),
              ),
              title: Text(
                'Espacios',
                style: TextStyle(
                    color: Color(0xff212871),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.idfon['ParkingSpaces']),
            )
          ],
        ),
      ),
    );
  }

  buildCardPhoto() {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AnimatedFlipCard(
            front: Image.network(
              widget.idfon['UrlImage'],
              width: 340,
              height: 200,
              fit: BoxFit.contain,
            ),
            back: Image.network(
              widget.idfon['UrlImageDesign'],
              width: 340,
              height: 200,
              fit: BoxFit.contain,
            )),
      ),
    );
  }

  buildStreet() {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: Color(0xffBFD7ED),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.map,
                color: Color(0xff212871),
              ),
              title: Text(
                'Calles',
                style: TextStyle(
                    color: Color(0xff212871),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.idfon['NameStreet'].toString()),
            )
          ],
        ),
      ),
    );
  }

  buildPrice() {
    return Container(
      child: FlipCard(
        //fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        front: Container(
          child: Text(
            'Tarifa... (Ver Mas.)',
            style: TextStyle(
                color: Color(0xff212871),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        back: Container(
          child: Text(
            widget.idfon['Price'],
            style: TextStyle(
              color: Color(0xff212871),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  buildSeeLocation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 20,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xff60A3D9),
        onPressed: () {
          Navigator.pushNamed(context, MyHomePage.id);
        },
        child: Text(
          'Volver',
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
