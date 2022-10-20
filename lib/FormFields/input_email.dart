import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/App/Validators/email_validator.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InputEmail> createState() => InputEmailState();
}

class InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateEmail(value!),
      controller: controllerDataModel.emailController,
    );
  }
}
