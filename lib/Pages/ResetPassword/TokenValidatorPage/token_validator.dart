import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/ResetPassword/ChangePasswordPage/change_password_page.dart';
import 'package:flutter_app/Pages/ResetPassword/Widgets/verification.dart';
import 'package:flutter_app/Pages/ResetPassword/SendEmailPage/send_email_reset.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';

class ValidatorEmailPage extends StatefulWidget {
  const ValidatorEmailPage({super.key});

  @override
  State<ValidatorEmailPage> createState() => _ValidatorEmailPageState();
}

class _ValidatorEmailPageState extends State<ValidatorEmailPage> {
  @override
  Widget build(BuildContext context) {
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
                  textInput: 'Validação',
                  callback: () {
                    Future.microtask(() {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const PasswordResetPage()),
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
                      '  Insira o código de autênticação que enviamos para seu email.',
                      style: tema.textstylesTitle,
                    ),
                  ),
                  const Verification(),
                  MainButton(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    text: 'Continuar',
                    callback: () {
                      Future.microtask(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ChangePasswordPage()),
                            (route) => false);
                      });
                    },
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
