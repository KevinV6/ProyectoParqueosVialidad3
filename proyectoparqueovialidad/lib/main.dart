import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal cliente',
      home: MenuPrinci(),
    );
  }
}

class MenuPrinci extends StatefulWidget {
  MenuPrinci({
    Key? key,
  }) : super(key: key);

  @override
  _MenuPrinciState createState() => _MenuPrinciState();
}

class _MenuPrinciState extends State<MenuPrinci> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  final Set<Marker> listMarkers = {};
  Set<Marker> Markers = {};
  Location location = Location();
  Location currentLocation = Location();
  late LocationData _currentPosition;
  late String _address, _dateTime;
  MapType currentMapType = MapType.normal;

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
        listMarkers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  //Boton de Navigation Bar
  int _currentIndex = 1;
  //final tabs = [
  //Center(child: Notificaciones()),
  // ];

  @override
  Widget build(BuildContext context) {
    listMarkers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(-17.4170476, -66.1787081),
        infoWindow:
            InfoWindow(title: "Aeropuerto Internacional Jorge Wilstermann"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("2"),
        position: LatLng(-17.3967255, -66.1575596),
        infoWindow: InfoWindow(title: "Tigo Bolivia - Sucursal Calama"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("3"),
        position: LatLng(-17.420121, -66.129354),
        infoWindow: InfoWindow(title: "Alcaldia de cochabamba"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("4"),
        position: LatLng(-17.392808, -66.158631),
        infoWindow: InfoWindow(title: "Agencia Boliviana de Correos Regional"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("5"),
        position: LatLng(-17.393856, -66.156896),
        infoWindow: InfoWindow(title: "Plaza de Armas 14 de septiembre"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("6"),
        position: LatLng(-17.380463, -66.151493),
        infoWindow: InfoWindow(title: "Cine Center"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("7"),
        position: LatLng(-17.3788394, -66.1609852),
        infoWindow: InfoWindow(title: "Estadio Americas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("8"),
        position: LatLng(-17.393284, -66.158470),
        infoWindow: InfoWindow(title: "Entel"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("9"),
        position: LatLng(-17.372008, -66.1591467),
        infoWindow: InfoWindow(title: "Las Islas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("10"),
        position: LatLng(-17.382303, -66.159749),
        infoWindow: InfoWindow(title: "Plaza de las Banderas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("11"),
        position: LatLng(-17.384525, -66.134984),
        infoWindow: InfoWindow(title: "Cristo de la Concordia"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("12"),
        position: LatLng(-17.402165, -66.146209),
        infoWindow: InfoWindow(title: "Laguna Alalay"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("13"),
        position: LatLng(-17.4025654, -66.1576406),
        infoWindow: InfoWindow(title: "Terminal de Buses Cochabamba"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("14"),
        position: LatLng(-17.368555, -66.163823),
        infoWindow: InfoWindow(title: "Plazuela Cala Cala"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("15"),
        position: LatLng(-17.385486, -66.148666),
        infoWindow: InfoWindow(title: "Hospital Viedma"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("16"),
        position: LatLng(-17.382381, -66.152295),
        infoWindow: InfoWindow(title: "Plaza Quintanilla"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("17"),
        position: LatLng(-17.360316, -66.158151),
        infoWindow: InfoWindow(title: "Centro de Salud Temporal"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("18"),
        position: LatLng(-17.3880541, -66.1558856),
        infoWindow: InfoWindow(title: "Plaza Colón"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    listMarkers.add(Marker(
        markerId: MarkerId("19"),
        position: LatLng(-17.364236, -66.162042),
        infoWindow: InfoWindow(title: "Semapa"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: currentMapType,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            initialCameraPosition: initCameraPosition,
            compassEnabled: true,
            markers: listMarkers,
            myLocationEnabled: true,
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              child: Icon(Icons.map, size: 30),
              onPressed: _onMapTypeChanged,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
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
    super.initState();
    setState(() {
      getLocation();
    });
  }
}
