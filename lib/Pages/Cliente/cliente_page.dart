import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/map.controller.dart';
import 'package:flutter_app/App/services/permission.dart';
import 'package:flutter_app/Pages/Cliente/ParkMap/park_map_page.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/parkin_area.dart';
import 'package:flutter_app/Widgets/rodape_area.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ClientePage extends StatelessWidget {
  const ClientePage({super.key});

  @override
  Widget build(BuildContext context) {
    PermissionService permissionService = PermissionService();
    MapController mapController = context.read<MapController>();
    log('ClientePage - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: tema.imageBackground,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.transparent,
                  child: ParkInArea(
                    callback: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.keyboard_return),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: tema.paletteDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 250,
                        child: SizedBox(
                          height: 42,
                          child: Center(
                            child: MainButton(
                              text: 'Prosseguir',
                              callback: () {
                                permissionService.handleLocationPermission(context).then((value){
                                  if(value == true){
                                    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value){
                                    mapController.changeUserPosition(value.latitude, value.longitude);
                                    Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const ParkMap()), ((route) => false));
                                  });
                                  }
                                });
                              },
                              height: 42,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          ),
                        ),
                      ),
                      const SocialArea(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
