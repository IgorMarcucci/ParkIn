import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove(
      {super.key,
      required this.color,
      required this.text,
      required this.callback,
      required this.height,
      required this.width});

  final Color color;
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
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(82, 0, 0, 0),
            offset: Offset(1, 3),
            blurRadius: 2.0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: SizedBox.expand(
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          onPressed: () {
            callback();
          },
          child: FittedBox(
            child: Text(
              text,
              style: tema.textStylesButton,
            ),
          ),
        ),
      ),
    );
  }
}
