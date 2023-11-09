import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/CarroValidator/placa_validator.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class InputPlaca extends StatefulWidget {
  const InputPlaca({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  State<InputPlaca> createState() => InputPlacaState();
}

class InputPlacaState extends State<InputPlaca> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    VehicleController vehicleController = context.read<VehicleController>();
    return TextFormField(
      inputFormatters: [PlacaVeiculoInputFormatter()],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.text,
      ),
      style: tema.textstyles,
      validator: (value) => validatePlaca(value!),
      controller: vehicleController.placaController,
    );
  }
}
