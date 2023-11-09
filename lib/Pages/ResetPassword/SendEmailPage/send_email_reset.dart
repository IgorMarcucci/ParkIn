import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';

import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:provider/provider.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseController firebaseController = FirebaseController();
    UserController userController =
        context.read<UserController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: tema.decorationButton,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              color: const Color.fromARGB(0, 207, 54, 54),
              child: Center(
                child: ParkInAreaGlobal(
                  textInput: 'Recuperação',
                  callback: () {
                    Future.microtask(() {
                      userController.clearControllers();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    });
                  },
                  icon: const Icon(Icons.keyboard_return),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: tema.paletteDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Insira seu email cadastrado no app para a recuperação de senha. Enviaremos um código para seu email para realizar a troca de senha.',
                      style: tema.textstylesTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InputEmail(
                    icon: const Icon(Icons.email),
                    text: "Insira o email da sua conta",
                    emailController: userController.emailController,
                  ),
                  MainButton(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    text: 'Recuperar Senha',
                    callback: () {
                      firebaseController.forgetPass(context, userController.setDataToChangePass());
                      userController.clearControllers();
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
