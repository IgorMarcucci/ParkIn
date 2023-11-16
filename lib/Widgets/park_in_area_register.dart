import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/button_return.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ParkInAreaGlobal extends StatelessWidget {
  const ParkInAreaGlobal(
      {super.key,
      required this.icon,
      required this.callback,
      required this.textInput});

  final Function callback;
  final Icon icon;
  final String textInput;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Column(
      children: [
        Row(
          children: [
            ButtonReturn(callback: callback, icon: icon),
          ],
        ),
        Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Park',
                    style: tema.parkText,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'In',
                    style: tema.inText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                textInput,
                style: tema.lineTextParkIn,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
