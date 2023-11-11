import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:geolocator/geolocator.dart';

class PermissionService {
  Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    if(context.mounted){
      message(context, "Serviço de localização negado, habilite para continuar");
    }
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      if(context.mounted){
        message(context, 'A permissão de acesso foi negada');
      }
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    if(context.mounted){
      message(context, 'As permissões de localização foram negadas permanentemente, não podemos solicitar permissões.');
    }
    return false;
  }
  return true;
}
}