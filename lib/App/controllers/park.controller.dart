import 'package:flutter/material.dart';

class ParkController extends ChangeNotifier {
  TextEditingController? nameController; 
  TextEditingController? qtdController; 
  TextEditingController? addressController;
  int? totalParkSpace;

  ParkController({
    required this.addressController,
    required this.qtdController,
    required this.nameController,
  });

  int listAvailableSpace(int parkSpace){
    return (totalParkSpace! - parkSpace);
  }
}
