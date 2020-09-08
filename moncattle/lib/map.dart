import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CowMap extends StatefulWidget {
  @override
  _CowMapState createState() => _CowMapState();
}

class _CowMapState extends State<CowMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-8.014995, -34.949509);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        elevation: .1,
        backgroundColor: Colors.black87,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          )),
    );
  }
}
