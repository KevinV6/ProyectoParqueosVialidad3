import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:proyectoparqueovialidad/InfoParqueo/infoparqueo.dart';
import 'package:firebase_auth/firebase_auth.dart';


class BuscadorWP extends SearchDelegate{
  BuscadorWP() : super(searchFieldLabel: "Escribe algo...");


  final TextEditingController _nameController = TextEditingController();


  CollectionReference _locations = FirebaseFirestore.instance.collection('Locations');


  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['Name'];


    }
  }


  // 2) segunda forma de id
  //var userID = FirebaseFirestore.instance.collection("products").doc().id;
  //acciones para la barra de aplicaciones
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed:()
        {
          query = "";
        },
      )
    ];

  }


  //icono principal a la izquierda de la barra de aplicaciones
  @override
  Widget buildLeading(BuildContext context) {  //Icono que usaremos para retornar
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed:() {
        close(context, null);
      },
    );
  }


  //mostrar algunos resultados basados en la selección
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }


  //mostrar cuando alguien busca algo
  @override
  Widget buildSuggestions(BuildContext context) {

    //final pro = query.isEmpty?_productss.where((p) => p.startsWith(query));
    //final LugaresSugeridos = query.isEmpty?Lugares.where((p) => p.startsWith(query)).toList();
    return Scaffold(
      body: StreamBuilder (
        stream: _locations.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index)  {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  shadowColor: Colors.teal.shade600,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  child: ListTile(
                    leading: Icon(Icons.location_city,
                        color: Colors.blueGrey),
                    title: TextButton(
                      child: Text (documentSnapshot['Name']),
                      style: TextButton.styleFrom(
                          alignment: Alignment.topLeft,
                          primary: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              foreground: Paint()
                          )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoParqueo(idfon: (documentSnapshot)),
                          ),
                        );
                      },

                    ),

                  ),
                );
              },
            );
          }

          return Center(

          );
        },
      ),

    );



  }
}


