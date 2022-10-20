import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class ButtonReturn extends StatelessWidget {
  const ButtonReturn({super.key, required this.callback, required this.icon});

  final Function callback;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
      decoration: tema.decorationfloating,
      child: SizedBox.expand(
          child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        onPressed: () {
          callback();
        },
        child: FittedBox(
          child: icon,
        ),
      )),
    );
  }
}
