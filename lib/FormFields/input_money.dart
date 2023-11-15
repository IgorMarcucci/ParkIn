import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/App/Validators/validate_money.dart';

class InputMoney extends StatefulWidget {
  const InputMoney({
    Key? key,
    required this.text,
    required this.typetxt,
    required this.icone,
    required this.moneyController,
  }) : super(key: key);
  final Icon icone;
  final String text;
  final TextInputType typetxt;
  final TextEditingController moneyController;

  @override
  State<InputMoney> createState() => _InputMoneyState();
}

class _InputMoneyState extends State<InputMoney> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CentavosInputFormatter(moeda: false),
      ],
      keyboardType: widget.typetxt,
      decoration: InputDecoration(
        icon: widget.icone,
        labelText: widget.text,
      ),
      controller: widget.moneyController,
      validator: (value) => validateMoney(value!),
    );
  }
}