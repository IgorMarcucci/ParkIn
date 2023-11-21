import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/FormFields/input_money.dart';

import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class RemoveVeiculo extends StatelessWidget {
  const RemoveVeiculo(
      {super.key, required this.callback, required this.callbackButtonBack});
  final Function callback;
  final Function callbackButtonBack;

  @override
  Widget build(BuildContext context) {
    
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    VehicleController vehicleController = context.read<VehicleController>();
    return AlertDialog(
      title: Text(
        'Remover veículo',
        style: tema.textstylesTitle,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: keys.removeVehicleKey,
          child: ListBody(
            children: <Widget>[
              InputMoney(
                text: 'Insira o valor cobrado', 
                typetxt: TextInputType.number, 
                icone: const Icon(Icons.attach_money), 
                moneyController: vehicleController.valueController!,
              ),
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
