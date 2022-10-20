import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/App/Validators/cpf_validator.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class InputCpf extends StatefulWidget {
  const InputCpf({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InputCpf> createState() => InputCpfState();
}

class InputCpfState extends State<InputCpf> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter(),
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateCpf(value!),
      controller: controllerDataModel.cpfController,
    );
  }
}
