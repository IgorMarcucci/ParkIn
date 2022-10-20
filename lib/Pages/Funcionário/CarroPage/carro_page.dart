import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/func_interface_model.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/ListaVagas/list_veiculos.dart';
import 'package:provider/provider.dart';

import '../../Cliente/InfoPage/Widgets/separators_info.dart';

class CarroPage extends StatelessWidget {
  const CarroPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Informações do usuário'),
        leading: IconButton(
          onPressed: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ListaVagasPage()),
                (route) => false));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Container(
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.account_circle_outlined,
                      size: 200,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome: ---------------', style: tema.textstyles),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Center(child: InfoSeparators()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text('Cidade: -------------', style: tema.textstyles,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Center(
                        child: Text('Informações do veículo:', style: tema.textstylesTitle,),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Text('Placa: ${interfaceModel.placa[index]}', style: tema.textstyles),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Center(child: InfoSeparators()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text('Modelo: ${interfaceModel.modelo[index]}', style: tema.textstyles),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Center(child: InfoSeparators()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text('Marca: ${interfaceModel.marca[index]}', style: tema.textstyles),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Center(child: InfoSeparators()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}