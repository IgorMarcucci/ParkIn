import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/email_validator.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({Key? key, required this.icon, required this.text, required this.emailController})
      : super(key: key);

  final Icon icon;
  final String text;
  final TextEditingController emailController;

  @override
  State<InputEmail> createState() => InputEmailState();
}

class InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateEmail(value!),
      controller: widget.emailController,
    );
  }
}
