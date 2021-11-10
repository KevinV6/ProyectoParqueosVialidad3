import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectoparqueovialidad/buscador_datos/buscadordatos.dart';
import 'package:proyectoparqueovialidad/main.dart';
import 'package:proyectoparqueovialidad/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MenuPrinci extends StatefulWidget {
  static String id = "menu_pages";

  MenuPrinci({
    Key? key,
  }) : super(key: key);

  @override
  _MenuPrinciState createState() => _MenuPrinciState();
}

class _MenuPrinciState extends State<MenuPrinci> {
  Completer<GoogleMapController> _controller = Completer();
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

  var error;

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
                IconButton( //Boton de buscador
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: BuscadorWP());
                  },
                )
              ],
            ),
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
        )
    );
  }

  createRuts() {
    FirebaseFirestore.instance.collection("Locations").get().then((docs) {
      if (docs.docs.isNotEmpty) {
        for (int i = 0; i < docs.docs.length; ++i) {
          if (docs.docs[i].data()['StatusLocation'] == "V") {
            if (docs.docs[i].data()['Parking'] == "No Tarifado") {
              initMarker(docs.docs[i].data(), docs.docs[i].id);
            } else {
              initRut(docs.docs[i].data(), docs.docs[i].id);
            }
          }
        }
      }
    });
  }

  void initMarker(lugar, lugaresid) {
    var markerIdVal = lugaresid;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lugar['Latitude'], lugar['Longitude']),
      infoWindow: InfoWindow(title: lugar['Name'], snippet: "Sin costo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }



  void initRut(data, idData) {
    var markerIdVal = idData;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(data['Latitude'], data['Longitude']),
      infoWindow: InfoWindow(title: data['Name'],snippet: " Tarifa: " + data['Price'] + " Bs."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    );

    final Polyline polyline = Polyline(
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      polylineId: PolylineId(idData),
      visible: true,
      points: [
        new LatLng(data['Latitude'], data['Longitude']),
        new LatLng(data['LatitudeTwo'], data['LongitudeTwo'])
      ],
      width: 3,
      color: Color.fromRGBO(232, 199, 93, 1.0),
    );

    setState(() {
      _polylines.add(polyline);
      markers[markerId] = marker;
    });
  }

  void _OnMapCreated(GoogleMapController mapController) {
    setState(() {
      _controller.complete(mapController);
    });
  }

  void getLocation() async{
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      }else if(e.code == "PERMISSION_DENIED_NEVER_ASK"){
        error = 'Permission denied';
      }
      currentLocation = '' as LocationData;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 17.0,
      ),
    ));
  }


  getLoc() async{
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
      currentMapType = currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }




  @override
  void initState() {
    createRuts();
    super.initState();
    getLoc();
  }
}