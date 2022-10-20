import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/App/Validators/name_validator.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class InputName extends StatefulWidget {
  const InputName({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  @override
  Widget build(BuildContext context) {
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateName(value!),
      controller: controllerDataModel.nameController,
    );
  }
}
