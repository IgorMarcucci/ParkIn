import 'package:flutter/material.dart';
import 'package:flutter_app/Views/Cliente/AboutPage/Widgets/dev.dart';
import 'package:flutter_app/Views/Cliente/InfoPage/Widgets/separators_info.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class Desenvolvedores extends StatelessWidget {
  const Desenvolvedores({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Column(
      children: [
        Text('Desenvolvedores', style: tema.textstyles),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          '  O App está sendo desenvolvido por dois alunos do 4º semestre do curso de Análise e Desenvolvimento de Sistemas da Fatec Ribeirão Preto',
          textAlign: TextAlign.start,
          style: tema.textstyles,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const DevInfo(
          asset: 'assets/igor.jpeg',
          name: 'Igor Daniel Silva Marcucci',
          turno: 'Noite',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const InfoSeparators(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const DevInfo(
          asset: 'assets/lima.jpeg',
          name: 'Guilherme Lima Ramos',
          turno: 'Manhã',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
