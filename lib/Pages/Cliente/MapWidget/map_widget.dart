import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/map.controller.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MapController mapController = context.watch<MapController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                  .pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                      ((route) => false));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
          title: const Text('Estacionamentos'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onTap: (position) {
                mapController.customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                mapController.customInfoWindowController.onCameraMove!();
              },
              onMapCreated: (GoogleMapController controller) async {
                mapController.customInfoWindowController.googleMapController = controller;
              },
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(target: LatLng(mapController.userPosition.latitude, mapController.userPosition.longitude), zoom: 15.0),
              markers: mapController.createMarkers(context),
            ),
            CustomInfoWindow(
              controller: mapController.customInfoWindowController,
              height: 120,
              width: 300,
              offset: 50,
            ),
          ],
        ),
      ),
    );
  }
}