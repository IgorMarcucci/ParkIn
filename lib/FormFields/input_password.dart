import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/password_validator.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.icon, required this.input, required this.passwordController})
      : super(key: key);

  final Icon icon;
  final String input;
  final TextEditingController passwordController;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

bool passEnable = true;

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: passEnable,
      style: tema.textstyles,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.input,
        suffix: IconButton(
          onPressed: () {
            setState(() {
              if (passEnable) {
                passEnable = false;
              } else {
                passEnable = true;
              }
            });
          },
          icon:
              Icon(passEnable == true ? Icons.remove_red_eye : Icons.password),
        ),
      ),
      controller: widget.passwordController,
      validator: (value) => validatePassword(value!),
    );
  }
}
