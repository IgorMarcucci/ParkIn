import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatefulWidget {
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
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: tema.decorationbox,
      child: SizedBox.expand(
        child: TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            onPressed: () {
              widget.callback();
            },
            child: FittedBox(
              child: Text(
                widget.text,
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
