import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    VehicleController vehicleController = context.read<VehicleController>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Informações do veículo',
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                decoration: tema.decorationContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        'Placa do carro: ${vehicleController.vehicle.carPlate}',
                        style: tema.textstylesTitle,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                    color: Colors.black87,
                    height: 0.4,
                    width: MediaQuery.of(context).size.width * 0.7),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        'Modelo: ${vehicleController.vehicle.modelName}',
                        style: tema.textstylesTitle,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                    color: Colors.black87,
                    height: 0.4,
                    width: MediaQuery.of(context).size.width * 0.7),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        'Marca: ${vehicleController.vehicle.brandName}',
                        style: tema.textstylesTitle,),
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                    color: Colors.black87,
                    height: 0.4,
                    width: MediaQuery.of(context).size.width * 0.7),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        vehicleController.vehicle.value == 0 ? "Valor não fechado" : 'Preço: R\$${formatValue.format(vehicleController.vehicle.value)}',
                        style: tema.textstylesTitle,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                    color: Colors.black87,
                    height: 0.4,
                    width: MediaQuery.of(context).size.width * 0.7),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        'Entrada: ${formatHour.format(DateTime.fromMillisecondsSinceEpoch(vehicleController.vehicle.entryTime!.millisecondsSinceEpoch))}',
                        style: tema.textstylesTitle,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                    color: Colors.black87,
                    height: 0.4,
                    width: MediaQuery.of(context).size.width * 0.7),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AutoSizeText(
                        vehicleController.vehicle.exitTime == null ? "Está no estacionamento" : 'Saída: ${formatHour.format(DateTime.fromMillisecondsSinceEpoch(vehicleController.vehicle.exitTime!.millisecondsSinceEpoch))}',
                        style: tema.textstylesTitle,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                        
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}