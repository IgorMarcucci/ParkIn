import 'package:flutter/material.dart';
import 'package:flutter_app/FormFields/input_marca.dart';
import 'package:flutter_app/FormFields/input_modelo.dart';
import 'package:flutter_app/FormFields/input_placa.dart';

class InsertArea extends StatelessWidget {
  const InsertArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputPlaca(icon: Icon(Icons.edit), text: 'Insira a placa'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const InputModelo(icon: Icon(Icons.edit), text: 'Insira o modelo'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const InputMarca(icon: Icon(Icons.edit), text: 'Insira a marca'),
      ],
    );
  }
}
