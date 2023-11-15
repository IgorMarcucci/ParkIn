import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/FuncionarioInterface/func_interface.dart';

import 'package:flutter_app/Pages/Funcion%C3%A1rio/RemoveVeiculos/veiculo_remove.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_veiculo.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_add_remove.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class ButtonAreaFuncInterface extends StatefulWidget {
  const ButtonAreaFuncInterface({super.key});

  @override
  State<ButtonAreaFuncInterface> createState() => _ButtonAreaFuncInterfaceState();
}

class _ButtonAreaFuncInterfaceState extends State<ButtonAreaFuncInterface> {
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
    FirebaseController firebaseController = FirebaseController();
    VehicleController vehicleController = context.read<VehicleController>();
    ParkController parkController  = context.read<ParkController>();
    return Column(
      children: [
        ButtonAddRemove(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 40,
          color: const Color.fromARGB(255, 13, 99, 10),
          text: '+ Adicionar veículo',
          callback: () {
            
              showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return InsertVeiculo(
                      callback: () {
                        if (keys.vehicleKey.currentState!.validate()) {
                                    firebaseController.postFunction(context, vehicleController.setDataToVehicleRegister(parkController.park));
                                    firebaseController.updateFunction(context, parkController.setDataToAddVehicleInPark());
                                    Future.delayed(const Duration(seconds: 4), () {
                                      parkController.clearControllers();
                                      Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const FuncInterface()),
                                ((route) => false));
                                    });
                                    
                                  }
                      },
                      callbackButtonBack: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
        
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        ButtonAddRemove(
          color: const Color.fromARGB(255, 184, 0, 0),
          text: '- Remover veículo',
          callback: () {
            if(parkController.park.currentQtd! > 0){
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const ListaVagasRemove()),
                ((route) => false),
              );
            } else {
              message(context, 'Não há vagas para remover');
            }
          },
          height: 40,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
