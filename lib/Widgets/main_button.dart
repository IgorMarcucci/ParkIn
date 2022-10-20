import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.text,
      required this.callback,
      required this.height,
      required this.width})
      : super(key: key);

  final String text;
  final Function callback;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      height: height,
      width: width,
      decoration: tema.decorationbox,
      child: SizedBox.expand(
        child: TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            onPressed: () {
              callback();
            },
            child: FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSlab(
                  fontSize: 28,
                ),
              ),
            )),
      ),
    );
  }
}
