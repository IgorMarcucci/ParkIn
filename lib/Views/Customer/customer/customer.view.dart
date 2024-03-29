import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user.model.dart';
import 'package:flutter_app/Views/Customer/customer/Widgets/button_area_drawer.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';
import 'package:flutter_app/Views/Customer/customer/Widgets/map_model.dart';
import 'package:provider/provider.dart';

class ClienteInterface extends StatefulWidget {
  const ClienteInterface({super.key});

  @override
  State<ClienteInterface> createState() => _ClienteInterfaceState();
}

class _ClienteInterfaceState extends State<ClienteInterface> {
  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    log('Cliente interface - Build');
    LoginController loginController = context.read<LoginController>();
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
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('usuarios')
                        .where('uid', isEqualTo: uid)
                        .get()
                        .then((value) {
                      if (value.docs.isNotEmpty) {
                        loginController.setNameAndEmailData(
                          value.docs[0].data()['nome'],
                        );
                      }
                    }),
                    builder: ((context, snapshot) {
                      return UserAccountsDrawerHeader(
                        decoration: tema.imageDrawer,
                        accountEmail: FittedBox(
                          child: Text(
                            loginController.email.toString(),
                            style: tema.textDrawer,
                          ),
                        ),
                        accountName: FittedBox(
                          child: Text(
                            loginController.name.toString(),
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
                      );
                    }),
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
