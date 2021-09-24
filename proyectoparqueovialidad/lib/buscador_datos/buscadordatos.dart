
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class BuscadorWP extends SearchDelegate{
  BuscadorWP() : super(searchFieldLabel: "Escribe algo...");

  final lugares = [
    "Tigo",
    "Plaza Principal",
    "Alcaldia",
    "El Correo",
    "Cine center",
    "Estadium America",
    "Entel",
    "Las isla",
    "Plaza Banderas",
    "Cristo Concordia",
    "Laguna Alalay",
    "La terminal",
    "El aeropuerto",
    "Plazuela CalaCala",
    "Hospital Vietma",
    "Plaza Quintanilla",
    "Centro de salud Temporal",
    "Semapa",
    "Plaza Colón"
  ];


  final lugaresRecientes = [
    "Laguna Alalay",
    "La terminal",
    "El aeropuerto",
    "Plazuela CalaCala",

  ];


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


  //mostrar algunos resultados basados ​​en la selección
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }


  //mostrar cuando alguien busca algo
  @override
  Widget buildSuggestions(BuildContext context) {

    final LugaresSugeridos = query.isEmpty?lugaresRecientes:lugares.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
                text: LugaresSugeridos[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: LugaresSugeridos[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)
                  )
                ]),
          ),
        ),
        itemCount:LugaresSugeridos.length
    );


  }
}
