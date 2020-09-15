import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'models/cow_notifier.dart';

class CowMap extends StatefulWidget {
  @override
  _CowMapState createState() => _CowMapState();
}

class _CowMapState extends State<CowMap> {
  //MapType _currentMapType = MapType.normal;
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
      body: _buildMap(),
    );
  }

  Widget _buildMap() {
    return Consumer<CowNotifier>(
      builder: (context, animals, child) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: GoogleMap(
              markers: getMarkers(),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ));
      },
    );
  }

  Set<Marker> getMarkers() {
    Set<Marker> _markers = {};
    var animals = context.read<CowNotifier>();
    animals.cows.forEach(
      (cow) {
        print(cow.name);
        print(cow.breed);
        print(cow.lat);
        print(cow.lon);
        _markers.add(
          Marker(
            // This marker id can be anything that uniquely identifies each marker.
            markerId: MarkerId(LatLng(cow.lat, cow.lon).toString()),
            position: LatLng(cow.lat, cow.lon),
            infoWindow: InfoWindow(
              title: cow.name,
              snippet: cow.idCollar,
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      },
    );
    return _markers;
  }
}
