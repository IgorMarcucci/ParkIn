import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/CarroValidator/modelo_validator.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class InputModelo extends StatefulWidget {
  const InputModelo({super.key, required this.icon, required this.text});

  final Icon icon;
  final String text;

  @override
  State<InputModelo> createState() => InputModeloState();
}

class InputModeloState extends State<InputModelo> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    VehicleController vehicleController = context.read<VehicleController>();
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validateModelo(value!),
      controller: vehicleController.modelController,
    );
  }
}
