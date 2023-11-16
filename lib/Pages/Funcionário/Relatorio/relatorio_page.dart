import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Widgets/loading_indicator.dart';
import 'package:flutter_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({super.key});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
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
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
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
          });
          return LayoutBuilder(
            builder: (context, p1) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.black12,
                  centerTitle: true,
                  title: const Text(
                    'Relatórios',
                    selectionColor: Colors.black,
                  ),
                ),
                drawerEnableOpenDragGesture: false,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height-110,
                      width: MediaQuery.of(context).size.width,
                      decoration: tema.decorationContainer,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: AutoSizeText(
                              'Dashboard',
                              style: tema.textstylesTitle,
                            ),
                          ),
                          Container(
                            color: const Color.fromARGB(255, 204, 204, 204),
                            height: 250,
                            margin: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          'Receita últimos 7 dias',
                                          style: tema.textstylesTitle,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            'Total:',
                                            style:
                                                tema.textstyles,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            vehicleController.index7days() > 0 ? "R\$ ${formatValue.format(vehicleController.sumValuesInSameWeek())}" : "R\$ 0,00",
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 36,
                                                fontWeight:
                                                    FontWeight
                                                        .w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          'Quantidade de veículos',
                                          style: tema.textstylesTitle,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            'Total:',
                                            style:
                                                tema.textstyles,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            vehicleController.index7days().toString(),
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 36,
                                                fontWeight:
                                                    FontWeight
                                                        .w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: const Color.fromARGB(255, 204, 204, 204),
                            height: 250,
                            margin: const EdgeInsets.fromLTRB(
                                15, 0, 15, 0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          'Receita últimos 30 dias',
                                          style: tema.textstylesTitle,
                                          overflow:
                                              TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            'Total: ',
                                            style:
                                                tema.textstyles,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            vehicleController.index1month() > 0 ? "R\$ ${formatValue.format(vehicleController.sumValuesInSameMonth())}" : "R\$ 0,00",
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 36,
                                                fontWeight:
                                                    FontWeight
                                                        .w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          'Quantidade de veículos',
                                          style: tema.textstylesTitle,
                                          overflow:
                                              TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            'Total: ',
                                            style:
                                                tema.textstyles,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: AutoSizeText(
                                            vehicleController.index1month().toString(),
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 36,
                                                fontWeight:
                                                    FontWeight
                                                        .w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('SEM DADOS PARA EXIBIR'),
            ),
          );
        }
        
      }
    );
  }
}