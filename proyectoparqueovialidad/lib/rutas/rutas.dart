import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
import 'package:proyectoparqueovialidad/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Rutas extends StatefulWidget {
  @override
  _RutasState createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  //final Set<Marker> listMarkers = {};
  //Set<Marker> Markers ={};
  Location location = Location();
  Location currentLocation = Location();
  late LocationData _currentPosition;
  late String _address, _dateTime;
  MapType currentMapType = MapType.normal;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<Map<dynamic, dynamic>> lists = [];

  Set<Polyline> _polylines = Set<Polyline>();

  static final CameraPosition initCameraPosition = CameraPosition(
      bearing: 30,
      target: LatLng(-17.3755459, -66.2543883),
      tilt: 45,
      zoom: 13.5);

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        position:
        LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(), //Boton de menu
      appBar: AppBar(
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

      body: Stack(
        children: [
          GoogleMap(
            mapType: currentMapType,
            onMapCreated: _OnMapCreated,
            initialCameraPosition: initCameraPosition,
            compassEnabled: true,
            polylines: _polylines,
            markers: Set<Marker>.of(markers.values),
            myLocationEnabled: true,
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              child: Icon(Icons.map, size: 30),
              onPressed: _onMapTypeChanged,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.location_searching,
                color: Colors.white,
              ),
              onPressed: getLocation,
            ),
          ),
        ],
      ),
    );
  }

  createRuts() {
    FirebaseFirestore.instance.collection("Streets").get().then((docs) {
      if (docs.docs.isNotEmpty) {
        for (int i = 0; i < docs.docs.length; ++i) {
          if (docs.docs[i].data()['StatusStreet'] == "V") {
            initRut(docs.docs[i].data(), docs.docs[i].id);
          }
        }
      }
    });
  }

  void initRut(data, idData) {
    var markerIdVal = idData;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(data['InitialLatitude'], data['InitialLongitude']),
      infoWindow: InfoWindow(title: data['Name'], snippet: data['Description']),
    );

    final Polyline polyline = Polyline(
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      polylineId: PolylineId(idData),
      visible: true,
      points: [
        new LatLng(data['InitialLatitude'], data['InitialLongitude']),
        new LatLng(data['EndLatitude'], data['EndLongitude'])
      ],
      width: 3,
      color: Color.fromRGBO(252, 82, 82, 1.0),
    );

    setState(() {
      _polylines.add(polyline);
      markers[markerId] = marker;
    });
  }

  void _OnMapCreated(GoogleMapController mapController) {
    setState(() {
      _controller = mapController;
    });
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void _onMapTypeChanged() {
    setState(() {
      currentMapType =
          currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  @override
  void initState() {
    createRuts();
    super.initState();
    setState(() {
      getLocation();
    });
  }
}
