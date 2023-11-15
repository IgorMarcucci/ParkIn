import 'package:flutter/material.dart';

import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/column_insert.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';

class InsertVeiculo extends StatelessWidget {
  const InsertVeiculo(
      {super.key, required this.callback, required this.callbackButtonBack});
  final Function callback;
  final Function callbackButtonBack;

  @override
  Widget build(BuildContext context) {
    
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return AlertDialog(
      title: Text(
        'Adicionar veículo',
        style: tema.textstylesTitle,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: keys.vehicleKey,
          child: ListBody(
            children: <Widget>[
              const InsertArea(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              MainButton(
                text: 'Confirmar',
                callback: callback,
                height: 42,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              MainButton(
                text: 'Sair',
                callback: callbackButtonBack,
                height: 42,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
