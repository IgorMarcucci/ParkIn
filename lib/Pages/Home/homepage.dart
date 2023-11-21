import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Cliente/cliente_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Pages/Home/Widgets/park_in_area.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/rodape_area.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('Homepage - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return SafeArea(
      child: Scaffold(
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
                      SizedBox(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 42,
                              child: Center(
                                child: MainButton(
                                  text: 'Funcionário',
                                  callback: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const FuncionarioPage()),);
                                  },
                                  height: 42,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 42,
                              child: Center(
                                child: MainButton(
                                  text: 'Cliente',
                                  callback: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const ClientePage()),);
                                  },
                                  height: 42,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SocialArea(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
