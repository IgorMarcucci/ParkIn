import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/App/controllers/firebase_controllers.dart';
import 'package:flutter_app/Pages/Cliente/ClienteInterface/Widgets/button_area_drawer.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/Cliente/ClienteInterface/Widgets/map_model.dart';
import 'package:provider/provider.dart';

class ClienteInterface extends StatefulWidget {
  const ClienteInterface({super.key});

  @override
  State<ClienteInterface> createState() => _ClienteInterfaceState();
  
}

class _ClienteInterfaceState extends State<ClienteInterface> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FirebaseFunctions().retornarUsuarioLogado(context);
  }

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    log('Cliente interface - Build');
    ControllerDataModel controllerDataModel =
        context.watch<ControllerDataModel>();
    print(controllerDataModel.name);
    // GoogleMapController mapController;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Mapa de estacionamento'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: tema.imageDrawer,
                    accountEmail: FittedBox(
                      child: Text(
                        controllerDataModel.email.toString(),
                        style: tema.textDrawer,
                      ),
                    ),
                    accountName: FittedBox(
                      child: Text(
                        controllerDataModel.name.toString(),
                        style: tema.textDrawer,
                      ),
                    ),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Color.fromARGB(255, 26, 26, 26),
                      ),
                    ),
                  ),
                  const ButtonAreaDrawer(),
                ],
              ),
            ],
          ),
        ),
        body: const MapModel());
  }
}
