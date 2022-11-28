import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/func_interface_model.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/RemoveVeiculos/veiculo_remove.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_veiculo.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_add_remove.dart';
import 'package:flutter_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonAreaFuncInterface extends StatelessWidget {
  const ButtonAreaFuncInterface({super.key});

  @override
  Widget build(BuildContext context) {
    
    FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
    return Column(
      children: [
        ButtonAddRemove(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 40,
          color: const Color.fromARGB(255, 13, 99, 10),
          text: '+ Adicionar veículo',
          callback: () {
            if(interfaceModel.vagasTotais != 0){
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return InsertVeiculo(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                          interfaceModel.incrementVagasOcup();
                          interfaceModel.adicionar(context);
                      }
                    },
                    callbackButtonBack: () {
                      interfaceModel.clearControllers();
                      Navigator.pop(context);
                    },
                  );
                }
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: FittedBox(
                  child: Text(
                    'Insira o Nº de vagas para continuar',
                    style: GoogleFonts.josefinSlab(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              );
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
            if(interfaceModel.vagasOcupadas != 0){
              Future.microtask(
                () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ListaVagasRemove()),
                    (route) => false),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: FittedBox(
                  child: Text(
                    'Não há vagas para remover',
                    style: GoogleFonts.josefinSlab(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              );
            }
          },
          height: 40,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
