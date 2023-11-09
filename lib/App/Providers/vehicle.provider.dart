import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider vehicleProvider =
    ChangeNotifierProvider<VehicleController>(
  create: (context) => VehicleController(
    placaController: TextEditingController(),
    modeloController: TextEditingController(),
    marcaController: TextEditingController(),
  ),
);