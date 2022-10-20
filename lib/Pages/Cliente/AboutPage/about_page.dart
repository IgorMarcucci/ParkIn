import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Cliente/AboutPage/Widgets/desenvolvedores.dart';
import 'package:flutter_app/Pages/Cliente/AboutPage/Widgets/objetivos.dart';
import 'package:flutter_app/Pages/Cliente/ClienteInterface/cliente_interface.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sobre',
        ),
        leading: IconButton(
          onPressed: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const ClienteInterface()),
                (route) => false));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'Quem somos nós?',
                  style: tema.textstylesTitle,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Objetivos(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Desenvolvedores(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
