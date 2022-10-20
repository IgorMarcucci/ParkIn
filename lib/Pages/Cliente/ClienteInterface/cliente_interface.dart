import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/Pages/Cliente/ClienteInterface/Widgets/button_area_drawer.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/Cliente/ClienteInterface/Widgets/map_model.dart';
import 'package:provider/provider.dart';

class ClienteInterface extends StatelessWidget {
  const ClienteInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    log('Cliente interface - Build');
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
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
                        controllerDataModel.setEmailFromController().toString(),
                        style: tema.textDrawer,
                      ),
                    ),
                    accountName: FittedBox(
                      child: Text(
                        controllerDataModel.setNameFromController().toString(),
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
