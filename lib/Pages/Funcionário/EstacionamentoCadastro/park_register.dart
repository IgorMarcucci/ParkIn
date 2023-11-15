import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';

import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/services/permission.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/FormFields/input_text.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:flutter_app/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ParkRegisterPage extends StatefulWidget {
  const ParkRegisterPage({Key? key}) : super(key: key);

  @override
  State<ParkRegisterPage> createState() => _ParkRegisterPageState();
}

class _ParkRegisterPageState extends State<ParkRegisterPage> {
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
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    ParkController parkController = context.read<ParkController>();
    PermissionService permissionService = PermissionService();
    StorageData storageData = StorageData();
    FirebaseController firebaseController = FirebaseController();
    UserController userController =
        context.read<UserController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: tema.decorationButton,
        child: Form(
          key: keys.parkRegisterKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: const Color.fromARGB(0, 207, 54, 54),
                child: Center(
                  child: ParkInAreaGlobal(
                    textInput: 'Cadastro do estacionamento',
                    callback: () {
                      Future.microtask(() {
                        message(context, 'Saindo...');
                        userController.clearControllers();
                        firebaseController.logout();
                        storageData.removeData('userData');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false);
                      });
                    },
                    icon: const Icon(Icons.keyboard_return),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: tema.paletteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const LineTitlePage(text: 'Estacionamento'),
                    Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        InputText(
                          controller: parkController.nameController!,
                          text: 'Insira o nome do estacionamento',
                          typetxt: TextInputType.text,
                          icon: const Icon(Icons.edit),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016,
                        ),
                        InputText(
                          controller: parkController.addressController!,
                          text: 'Insira o endereço do estacionamento',
                          typetxt: TextInputType.text,
                          icon: const Icon(Icons.location_on),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016,
                        ),
                        InputText(
                          controller: parkController.qtdController!,
                          text: 'Insira a quantidade de vagas',
                          typetxt: TextInputType.text,
                          icon: const Icon(Icons.location_on),
                        ),
                      ],
                    ),
                  ),
                  MainButton(
                    height: 42,
                    width: MediaQuery.of(context).size.width * 0.6,
                    text: 'Cadastrar',
                    callback: () {
                      if (keys.parkRegisterKey.currentState!.validate()) {
                        permissionService.handleLocationPermission(context).then((value){
                          Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value){
                            parkController.changeParkPosition(value.latitude, value.longitude);
                            firebaseController.postFunction(context, parkController.setDataToRegisterPark(user));
                            Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const FuncInterface()),
                            (route) => false);
                          });
                        });
                        
                      }
                    },
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
