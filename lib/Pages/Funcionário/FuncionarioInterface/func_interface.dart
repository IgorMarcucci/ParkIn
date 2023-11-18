
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';

import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/EstacionamentoCadastro/park_register.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Historico/historico_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/ListaVagas/list_veiculos.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Relatorio/relatorio_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_area_func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_vagas.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/buttons_with_border.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Widgets/loading_indicator.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class FuncInterface extends StatefulWidget {
  const FuncInterface({super.key});

  @override
  State<FuncInterface> createState() => _FuncInterfaceState();
}

class _FuncInterfaceState extends State<FuncInterface> {
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
    StorageData storageData = StorageData();
    FirebaseController firebaseController = FirebaseController();
    ParkController parkController = context.read<ParkController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: firebaseController.getData(user, 'parks'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  storageData.removeData('userData');
                  firebaseController.logout();
                  Navigator.of(context)
                .pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const HomePage()),
                    ((route) => false));
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: const Center(
              child: AutoSizeText('Erro de conexão, clique para sair'),
            ),
          );
        }
        if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            parkController.addList(parkController.convertToParkList(snapshot.data!));
            storageData.saveParkData({"name": parkController.park.name, "id": parkController.park.id, "uid": parkController.park.uid, "address": parkController.park.address}, 'parkData');
          });
          return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Funcionário',
            ),
          ),
          drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 220,
                            child: UserAccountsDrawerHeader(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 214, 214, 214),
                              ),
                              accountEmail: FittedBox(
                                child: AutoSizeText(
                                  user.email.toString(),
                                  style: tema.textDrawer,
                                ),
                              ),
                              accountName: FittedBox(
                                child: AutoSizeText(
                                  user.username.toString(),
                                  style: tema.textDrawer,
                                ),
                              ),
                              currentAccountPicture: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 80,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: SizedBox(
                                  height: 42,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: AutoSizeText(
                                      'Histórico',
                                      style: tema.textstyles,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                    .push(
                                        MaterialPageRoute(
                                            builder: (context) => const HistoricoPage()),
                                    );
                                },
                              ),
                              ListTile(
                                title: SizedBox(
                                  height: 42,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: AutoSizeText(
                                      'Relatórios',
                                      style: tema.textstyles,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                    .push(
                                        MaterialPageRoute(
                                            builder: (context) => const RelatorioPage()),
                                    );
                                },
                              ),
                              ListTile(
                                title: SizedBox(
                                  height: 42,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: AutoSizeText(
                                      'Sair',
                                      style: tema.textstyles,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  storageData.removeData('userData');
                                  firebaseController.logout();
                                  Navigator.of(context)
                                    .pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => const HomePage()),
                                        ((route) => false),
                                    );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          body: Consumer<ParkController>(
              builder: (context, value, child) {
                return Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 15, 30, 35),
                  width: MediaQuery.of(context).size.width * 0.98,
                  decoration: tema.decorationContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                          'Vagas totais: ${parkController.park.qtd ?? 0}',
                          style: tema.textstylesTitle),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      AutoSizeText(
                          'Vagas disponíveis: ${parkController.park.qtd == null && parkController.park.currentQtd == null ? 0 : parkController.listAvailableSpace()}',
                          style: tema.textstylesTitle),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      AutoSizeText(
                        'Vagas ocupadas: ${parkController.park.currentQtd ?? 0}',
                        style: tema.textstylesTitle,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      const ButtonAreaFuncInterface(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    ButtonBorders(
                      callback: () {
                        Navigator.of(context)
                            .push(
                                MaterialPageRoute(
                                    builder: (context) => const ListaVagasPage()),
                                );
                      },
                      text: 'Lista de vagas',
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    ButtonBorders(
                      callback: () {
                        showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return InputVagas(
                                callbackButtonBack: () {
                                  parkController.clearControllers();
                                  Navigator.of(context).pop();
                                },
                                callback: () {
                                  if (keys.vacancyKey.currentState!.validate()) {
                                    firebaseController.updateFunction(context, parkController.setDataToChangePark());
                                    Future.delayed(const Duration(seconds: 2), () {
                                      parkController.clearControllers();
                                      Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const FuncInterface()),
                                ((route) => false));
                                    });
                                    
                                  }
                                },
                              );
                            });
                      },
                      text: 'Alterar Nº de vagas',
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ],
                ),
              ),
            ],
          );
              }),
        );
        } else {
          return const ParkRegisterPage();
        }
        
      }
    );
  }
}
