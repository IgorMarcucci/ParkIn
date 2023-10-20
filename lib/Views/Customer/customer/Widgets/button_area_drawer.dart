import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user.model.dart';
import 'package:flutter_app/Views/Customer/about/about.view.dart';
import 'package:flutter_app/Views/Customer/info/info.view.dart';
import 'package:flutter_app/Views/Home/homepage.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/separator_buttons.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/user.controller.dart';

class ButtonAreaDrawer extends StatelessWidget {
  const ButtonAreaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.read<LoginController>();
    return Column(
      children: [
        const SeparatorButtons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        MainButton(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.55,
          text: 'Ver Info',
          callback: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const InfoPage()),
                (route) => false));
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const SeparatorButtons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        MainButton(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.55,
          text: 'Sobre nós',
          callback: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const AboutPage()),
                (route) => false));
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const SeparatorButtons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        MainButton(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.55,
          text: 'Sair',
          callback: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false));
            FirebaseFunctions().logout();
            loginController.clearControllers();
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      ],
    );
  }
}
