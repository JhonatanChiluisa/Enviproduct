import 'dart:async';
import 'package:application_enviproduct_v01/src/models/entregas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class MapaWidget extends StatefulWidget {
  MapaWidget({Key? key, required this.listaentrega}) : super(key: key);

  Entrega listaentrega;
  @override
  State<MapaWidget> createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  late final latitud = widget.listaentrega.lat;
  late final longitud = widget.listaentrega.lng;
  late final nombre = widget.listaentrega.nombre;
  late final destino = widget.listaentrega.lugarDestino;

  late final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-1.8312, -78.1834),
    zoom: 6.9766,
  );

  late final Marker? _marker = Marker(
    markerId: MarkerId(nombre!),
    position: LatLng(latitud as double, longitud as double),
    infoWindow: InfoWindow(
      title: nombre,
      snippet: destino,
    ),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        padding: const EdgeInsets.only(
          top: 650.0,
        ),
        markers: <Marker>{_marker!},
      ),
    );
  }
}
