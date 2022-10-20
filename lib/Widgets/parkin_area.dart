import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/button_return.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ParkInArea extends StatelessWidget {
  const ParkInArea({Key? key, required this.icon, required this.callback})
      : super(key: key);

  final Function callback;
  final Icon icon;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
      ],
    );
  }
}
