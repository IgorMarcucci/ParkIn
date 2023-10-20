import 'package:flutter/material.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class Objetivos extends StatelessWidget {
  const Objetivos({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Objetivos', style: tema.textstyles),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          '  O Aplicativo ParkIn consiste em uma aplicação para dispositivos móveis que visa fornecer suporte de reserva de vagas e pagamentos via App para clientes que fazem uso do estacionamento.',
          textAlign: TextAlign.start,
          style: tema.textstyles,
        ),
      ],
    );
  }
}
