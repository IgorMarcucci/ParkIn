import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove(
      {Key? key,
      required this.color,
      required this.text,
      required this.callback,
      required this.height,
      required this.width})
      : super(key: key);

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
              color: Color.fromARGB(144, 17, 17, 17),
              offset: Offset(2, 3),
              blurRadius: 7.0,
              blurStyle: BlurStyle.normal)
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
