import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Pages/ResetPassword/Widgets/reset_area_input.dart';
import 'package:flutter_app/Pages/ResetPassword/TokenValidatorPage/token_validator.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:provider/provider.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
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
                      controllerDataModel.clearControllers();
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
                  const ResetArea(),
                  MainButton(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    text: 'Recuperar Senha',
                    callback: () {
                      Future.microtask(() {
                        controllerDataModel.clearControllers();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ValidatorEmailPage()),
                            (route) => false);
                      });
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
