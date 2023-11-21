import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/map.controller.dart';
import 'package:flutter_app/Pages/Cliente/MapWidget/map_widget.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/loading_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ParkMap extends StatelessWidget {
  const ParkMap({super.key});

  @override
  Widget build(BuildContext context) {
    MapController mapController = context.read<MapController>();
    FirebaseController firebaseController = FirebaseController();
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: firebaseController.getAllData('parks'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }
        if (snapshot.hasError) {
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
              ),
              body: const Center(
                child: AutoSizeText('Erro de conexão, clique para sair'),
              ),
            ),
          );
        }
        if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            mapController.addList(mapController.convertToParkList(snapshot.data!));
          });
          return const MapWidget();
        } else {
          return  GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(mapController.userPosition.latitude, mapController.userPosition.longitude), zoom: 20.0),
            // markers: mapController.createMarkers(),
          );
        }
      }
    );
  }
}