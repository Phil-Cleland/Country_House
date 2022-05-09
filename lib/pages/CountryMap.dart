import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatelessWidget {
  final String name;
  final List lat;

  CountryMap(this.name, this.lat);

  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
    target: LatLng(lat[0], lat[1]),
    zoom: 7,
  ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
