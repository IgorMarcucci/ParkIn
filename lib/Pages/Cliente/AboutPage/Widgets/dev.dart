import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/separator_buttons.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class DevInfo extends StatelessWidget {
  const DevInfo(
      {super.key,
      required this.asset,
      required this.name,
      required this.turno});

  final String asset;
  final String name;
  final String turno;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage(asset),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const SeparatorButtons(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'Nome: $name',
            style: tema.textstyles,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const SeparatorButtons(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'Ciclo: 4º Semestre',
            style: tema.textstyles,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const SeparatorButtons(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'Turno: $turno',
            style: tema.textstyles,
          ),
        ],
      ),
    );
  }
}
