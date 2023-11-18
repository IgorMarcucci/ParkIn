import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/button_area.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/parkin_area.dart';
import 'package:flutter_app/Widgets/rodape_area.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class FuncionarioPage extends StatelessWidget {
  const FuncionarioPage({super.key});

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
                    Navigator.of(context).pop();
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LineTitlePage(text: 'Funcionário:'),
                    TextArea(),
                    SocialArea(),
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
