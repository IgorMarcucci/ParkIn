import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Pages/ResetPassword/TokenValidatorPage/token_validator.dart';
import 'package:flutter_app/Pages/ResetPassword/Widgets/input_password_area.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/main.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: tema.decorationButton,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: const Color.fromARGB(0, 207, 54, 54),
                child: Center(
                  child: ParkInAreaGlobal(
                    textInput: 'Nova senha',
                    callback: () {
                      Future.microtask(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ValidatorEmailPage()),
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
                        '  Insira a nova senha.',
                        style: tema.textstylesTitle,
                      ),
                    ),
                    const InputPasswordArea(),
                    MainButton(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      text: 'Alterar senha',
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          Future.microtask(() {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
