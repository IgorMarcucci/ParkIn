import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel extends StatelessWidget {
  const MapModel({super.key});

  @override
  Widget build(BuildContext context) {
    void onMapCreated(mapController) {
      mapController = mapController;
    }

    double lat = -21.186991913455877;
    double long = -47.83330540278311;

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, long),
        zoom: 20.0,
      ),
      onMapCreated: onMapCreated,
    );
  }
}
