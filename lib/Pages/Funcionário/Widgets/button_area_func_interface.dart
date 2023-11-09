import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';

import 'package:flutter_app/Pages/Funcion%C3%A1rio/RemoveVeiculos/veiculo_remove.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_veiculo.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_add_remove.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:provider/provider.dart';

class ButtonAreaFuncInterface extends StatelessWidget {
  const ButtonAreaFuncInterface({super.key});

  @override
  Widget build(BuildContext context) {
    ParkController parkController  = context.read<ParkController>();
    return Column(
      children: [
        ButtonAddRemove(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 40,
          color: const Color.fromARGB(255, 13, 99, 10),
          text: '+ Adicionar veículo',
          callback: () {
            if (parkController.totalParkSpace != 0) {
              showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return InsertVeiculo(
                      callback: () {
                      },
                      callbackButtonBack: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            } else {
              message(context, 'Insira o Nº de vagas para continuar');
            }
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        ButtonAddRemove(
          color: const Color.fromARGB(255, 184, 0, 0),
          text: '- Remover veículo',
          callback: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const ListaVagasRemove()),
                ((route) => false),
              );
            // } else {
            //   message(context, 'Não há vagas para remover');
            // }
          },
          height: 40,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
