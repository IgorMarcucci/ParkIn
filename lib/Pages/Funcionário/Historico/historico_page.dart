
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Information/information_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_list.dart';
import 'package:flutter_app/Widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
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
    FirebaseController firebaseController = FirebaseController();
    VehicleController vehicleController = context.read<VehicleController>();
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: firebaseController.getVehicles(park, 'vehicles'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }
        if (snapshot.hasError) {
          return SafeArea(
            child: Scaffold(
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
            ),
          );
        }
        if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            vehicleController.addList(vehicleController.convertToVehicleList(snapshot.data!));
          });
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
            'Histórico de veículos',
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
                  itemCount: vehicleController.vehicleList.length,
                  itemBuilder: (context, index) {
            return ButtonList(
              callback: () {
                vehicleController.setDataToModel(vehicleController.vehicleList[index]);
                Navigator.of(context)
                  .push(
                      MaterialPageRoute(
                          builder: (context) => const InformationPage()),
                  );
              },
              height: 130,
              width: MediaQuery.of(context).size.width * 0.7,
              text: vehicleController.vehicleList[index].carPlate.toString(),
              secondText: vehicleController.vehicleList[index].modelName.toString(),
              thirdText: vehicleController.vehicleList[index].brandName.toString(),
              vagaCounter: (index + 1).toString(),
            );
                  },
                );
          
                  },
                ),
              ),
          );
        } else {
          return const SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Sem veículos para exibir'),
              ),
            ),
          );
        }
        
      }
    );
  }
}
