import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';

import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/services/permission.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/FormFields/input_text.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ParkRegister extends StatefulWidget {
  const ParkRegister({Key? key}) : super(key: key);

  @override
  State<ParkRegister> createState() => _ParkRegisterState();
}

class _ParkRegisterState extends State<ParkRegister> {
  UserModel user = UserModel();

  @override
  void initState() {
    StorageData storageData = StorageData();
    Map<String, dynamic> map =
        Map<String, dynamic>.from(storageData.readData('userData'));
    user = UserModel.fromJson(map);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    log('Register page - Build');
    PermissionService permissionService = PermissionService();
    ParkController parkController = context.read<ParkController>();
    FirebaseController firebaseController = FirebaseController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: keys.parkRegisterKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: const Color.fromARGB(0, 207, 54, 54),
                child: Center(
                  child: ParkInAreaGlobal(
                    textInput: 'Cadastro do estacionamento',
                    callback: () {
                      Future.microtask(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const FuncionarioPage()),
                            (route) => false);
                      });
                    },
                    icon: const Icon(Icons.keyboard_return),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        InputText(
                          controller: parkController.nameController!,
                          text: 'Insira o nome do estacionamento',
                          typetxt: TextInputType.text,
                          icone: const Icon(Icons.edit),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016,
                        ),
                        InputText(
                          controller: parkController.addressController!,
                          text: 'Insira o endereço do estacionamento',
                          typetxt: TextInputType.text,
                          icone: const Icon(Icons.location_on),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016,
                        ),
                        InputText(
                          controller: parkController.qtdController!,
                          text: 'Insira a quantidade de vagas',
                          typetxt: TextInputType.text,
                          icone: const Icon(Icons.location_on),
                        ),
                      ],
                    ),
                  ),
                  MainButton(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    text: 'Cadastrar',
                    callback: () {
                      if (keys.parkRegisterKey.currentState!.validate()) {
                        permissionService.handleLocationPermission(context).then((value){
                          Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value){
                            parkController.changeParkPosition(value.latitude, value.longitude);
                            firebaseController.randomPostFunction(context, parkController.returnRegisterParkModel(user));
                          });
                        });
                        
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
