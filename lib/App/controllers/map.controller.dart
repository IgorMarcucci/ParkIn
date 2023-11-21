import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends ChangeNotifier {
  List<ParkModel> parkList = [];
  GeoPoint userPosition = const GeoPoint(0, 0);
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  // MapController({

  // });

  void addList(List<ParkModel> value){
    parkList = value;
    notifyListeners();
  }

  void clearList(){
    parkList.clear();
    notifyListeners();
  }
  
  List<ParkModel> convertToParkList(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    return snapshots
        .map((snapshot) => ParkModel.fromSnapshot(snapshot))
        .toList();
  }

  void changeUserPosition(double lat, double long) {
    userPosition = GeoPoint(lat, long);
    notifyListeners();
  }

  Set<Marker> createMarkers(BuildContext context) {
    Set<Marker> markers = <Marker>{};

    for (var data in parkList) {
      if (data.locale != null) {
        GeoPoint geoPoint = data.locale!;
        LatLng latLng = LatLng(geoPoint.latitude, geoPoint.longitude);

        markers.add(
          Marker(
            markerId: MarkerId(data.id!),
            position: latLng,
           onTap:() {
              customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(82, 0, 0, 0),
                          offset: Offset(1, 3),
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.normal,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ESTACIONAMENTO',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Nome: ${data.name}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Endereço: ${data.address}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Lotação: ${data.currentQtd}/${data.qtd}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
            latLng,
          );  
           },
          ),
        );
      }
    }

    return markers;
  }
}