import 'package:flutter/material.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class ParkInAreaHome extends StatelessWidget {
  const ParkInAreaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Center(
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
    );
  }
}
