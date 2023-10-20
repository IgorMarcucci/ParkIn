import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/App/Validators/vagas_validator.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class InsertVagas extends StatefulWidget {
  const InsertVagas({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InsertVagas> createState() => InsertVagasState();
}

class InsertVagasState extends State<InsertVagas> {
  @override
  Widget build(BuildContext context) {
    // FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => numberValidator(value!),
      // controller: interfaceModel.vagasController,
    );
  }
}
