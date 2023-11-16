
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

class ListaVagasPage extends StatefulWidget {
  const ListaVagasPage({super.key});

  @override
  State<ListaVagasPage> createState() => _ListaVagasPageState();
}

class _ListaVagasPageState extends State<ListaVagasPage> {
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
          'Veículos',
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
          return ButtonList(
            callback: () {
              vehicleController.setDataToModel(vehicleController.filteredVehicleList[index]);
              Navigator.of(context)
                .push(
                    MaterialPageRoute(
                        builder: (context) => const InformationPage()),
                );
            },
            height: 130,
            width: MediaQuery.of(context).size.width * 0.7,
            text: vehicleController.filteredVehicleList[index].carPlate.toString(),
            secondText: vehicleController.filteredVehicleList[index].modelName.toString(),
            thirdText: vehicleController.filteredVehicleList[index].brandName.toString(),
            vagaCounter: (index + 1).toString(),
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
