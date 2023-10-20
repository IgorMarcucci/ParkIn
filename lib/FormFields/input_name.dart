import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/name_validator.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class InputName extends StatefulWidget {
  const InputName({Key? key, required this.icon, required this.text, required this.nameController})
      : super(key: key);

  final Icon icon;
  final String text;
  final TextEditingController nameController;

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateName(value!),
      controller: widget.nameController,
    );
  }
}
