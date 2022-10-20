import 'package:flutter/material.dart';

import 'package:flutter_app/FormFields/input_qtd_vagas.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';

class InputVagas extends StatelessWidget {
  const InputVagas(
      {Key? key, required this.callback, required this.callbackButtonBack})
      : super(key: key);

  final Function callback;
  final Function callbackButtonBack;

  @override
  Widget build(BuildContext context) {
    
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return AlertDialog(
      title: Text(
        'Adicionar vagas',
        style: tema.textstylesTitle,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: ListBody(
            children: <Widget>[
              const InsertVagas(
                  icon: Icon(Icons.format_list_numbered),
                  text: 'Insira o Nº de vagas'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              MainButton(
                text: 'Confirmar',
                callback: callback,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              MainButton(
                text: 'Sair',
                callback: callbackButtonBack,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
