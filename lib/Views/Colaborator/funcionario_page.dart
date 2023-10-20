import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Views/Funcion%C3%A1rio/LoginPage/login_page.dart';
import 'package:flutter_app/Views/Funcion%C3%A1rio/RegisterPage/register_page.dart';
import 'package:flutter_app/Views/Home/homepage.dart';
import 'package:flutter_app/Widgets/button_area.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/parkin_area.dart';
import 'package:flutter_app/Widgets/rodape_area.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class FuncionarioPage extends StatelessWidget {
  const FuncionarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Funcionario page - Build');
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
                child: ParkInArea(
                  callback: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.keyboard_return),
                ),
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
                    const LineTitlePage(text: 'Funcionário:'),
                    TextArea(
                        topSize: MediaQuery.of(context).size.height * 0.02,
                        size: MediaQuery.of(context).size.height * 0.04,
                        secondCallback: () {
                          Future.microtask(
                            () => Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPageFuncionario()),
                                (route) => false),
                          );
                        },
                        secondText: 'Cadastro',
                        callback: () {
                          Future.microtask(
                            () => Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginPageFuncionario()),
                                (route) => false),
                          );
                        },
                        text: 'Login'),
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
