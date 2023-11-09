import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Cliente/cliente_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Pages/Home/Widgets/park_in_area.dart';
import 'package:flutter_app/Widgets/button_area.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/rodape_area.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Homepage - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: tema.imageBackground,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.transparent,
                child: const ParkInAreaHome(),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: tema.paletteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                      text: 'Prosseguir',
                      callback: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const FuncionarioPage()),
                            (route) => false);
                      },
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    // TextArea(
                    //   topSize: MediaQuery.of(context).size.height * 0.08,
                    //   size: MediaQuery.of(context).size.height * 0.12,
                    //   text: 'Cliente',
                    //   callback: () {
                    //     // Navigator.of(context).pushAndRemoveUntil(
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => const ClientePage()),
                    //     //     (route) => false);
                    //   },
                    //   secondText: 'Funcionário',
                    //   secondCallback: () {
                    //     Navigator.of(context).pushAndRemoveUntil(
                    //         MaterialPageRoute(
                    //             builder: (context) => const FuncionarioPage()),
                    //         (route) => false);
                    //   },
                    // ),
                    const SocialArea(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
