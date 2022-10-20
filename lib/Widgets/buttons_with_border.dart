import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ButtonBorders extends StatelessWidget {
  const ButtonBorders(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.callback});

  final String text;
  final double height;
  final double width;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      height: height,
      width: width,
      decoration: tema.decorationBoxRodape,
      child: SizedBox.expand(
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
          onPressed: () {
            callback();
          },
          child: FittedBox(
            child: Text(
              text,
              style: tema.textstyles,
            ),
          ),
        ),
      ),
    );
  }
}
