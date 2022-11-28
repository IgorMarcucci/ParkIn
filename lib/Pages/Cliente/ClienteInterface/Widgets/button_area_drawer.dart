import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/Pages/Cliente/AboutPage/about_page.dart';
import 'package:flutter_app/Pages/Cliente/InfoPage/info_page.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/separator_buttons.dart';
import 'package:provider/provider.dart';

class ButtonAreaDrawer extends StatelessWidget {
  const ButtonAreaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController =
        context.read<LoginController>();
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
        // const SeparatorButtons(),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        // MainButton(
        //   height: 50,
        //   width: MediaQuery.of(context).size.width * 0.55,
        //   text: 'Favoritos',
        //   callback: () {},
        // ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const SeparatorButtons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        MainButton(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.55,
          text: 'Sair',
          callback: () {
            loginController.emailController.clear();
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false));
            loginController.clearControllers();
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      ],
    );
  }
}
