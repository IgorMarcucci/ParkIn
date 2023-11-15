import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/LoginPage/login_page.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/RegisterPage/register_page.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/separator.dart';

class TextArea extends StatelessWidget {
  const TextArea(
      {Key? key,})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButton(
          height: 42,
          width: MediaQuery.of(context).size.width * 0.6,
          text: 'Login',
          callback: (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const LoginPageFuncionario()),
                (route) => false);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Separator(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        MainButton(
          text: 'Cadastrar',
          callback: (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const RegisterPageFuncionario()),
                (route) => false);
          },
          height: 42,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
