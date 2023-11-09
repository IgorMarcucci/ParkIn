import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider parkProvider =
    ChangeNotifierProvider<ParkController>(
  create: (context) => ParkController(addressController: TextEditingController(), qtdController: TextEditingController(), nameController: TextEditingController()),
);
