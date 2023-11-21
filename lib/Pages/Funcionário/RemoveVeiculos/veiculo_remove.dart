import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_list.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/remove_veiculo.dart';
import 'package:flutter_app/Widgets/loading_indicator.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class ListaVagasRemove extends StatefulWidget {
  const ListaVagasRemove({super.key});

  @override
  State<ListaVagasRemove> createState() => _ListaVagasRemoveState();
}

class _ListaVagasRemoveState extends State<ListaVagasRemove> {
  ParkModel park = ParkModel();

  @override
  void initState() {
    StorageData storageData = StorageData();
    Map<String, dynamic> map =
        Map<String, dynamic>.from(storageData.readParkData('parkData'));
    park = ParkModel.fromJson(map);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ParkController parkController = context.read<ParkController>();
    FirebaseController firebaseController = FirebaseController();
    VehicleController vehicleController = context.read<VehicleController>();
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: firebaseController.getVehicles(park, 'vehicles'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: const Center(
              child: AutoSizeText('Erro de conexão, clique para voltar'),
            ),
          );
        }
        if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            vehicleController.addList(vehicleController.convertToVehicleList(snapshot.data!));
            vehicleController.filterList();
          });
          return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Remover veículos',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<VehicleController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: vehicleController.filteredVehicleList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return RemoveVeiculo(
                          callback: () {
                            if (keys.removeVehicleKey.currentState!.validate()) {
                                if(parkController.park.currentQtd! > 0){
                                  firebaseController.personalizedFunctionVehicle(context, vehicleController.setDataToChangeVehicle(parkController.park, vehicleController.filteredVehicleList[index]),  parkController.setDataToRemoveVehicleInPark());
                                  parkController.clearControllers();
                                  // vehicleController.clearControllers();
                                } else {
                                  message(context, 'Não há mais carros para excluir');
                                }
                                        
                            }
                          },
                          callbackButtonBack: () {
                            Navigator.of(context).pop();
                          },
                        );
                      });
                },
                key: const Key('dismissibleKey'),
                child: ButtonList(
                  callback: () {
                  },
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  text: vehicleController.filteredVehicleList[index].carPlate.toString(),
                  secondText: vehicleController.filteredVehicleList[index].modelName.toString(),
                  thirdText: vehicleController.filteredVehicleList[index].brandName.toString(),
                  vagaCounter: (index + 1).toString(),
                ),
              );
            },
          );
        },
      ),
    );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Sem veículos para exibir'),
            ),
          );
        }
        
      }
    );
  }
}
