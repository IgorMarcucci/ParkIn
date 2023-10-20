import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/CarroValidator/marca_validator.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class InputMarca extends StatefulWidget {
  const InputMarca({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InputMarca> createState() => InputMarcaState();
}

class InputMarcaState extends State<InputMarca> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    // FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateMarca(value!),
      // controller: interfaceModel.marcaController,
    );
  }
}
