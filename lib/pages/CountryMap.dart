import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatelessWidget {
  // final String name;
  // final List lat;

  // CountryMap(this.name, this.lat);

  static const routename = '/countryMap';

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(country['lat'][0], country['lat'][1]),
          zoom: 7,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
