import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/App/Validators/vagas_validator.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

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
    ParkController parkController = context.read<ParkController>();
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
      controller: parkController.qtdController,
    );
  }
}
