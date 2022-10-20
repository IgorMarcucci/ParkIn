import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineTitlePage extends StatelessWidget {
  const LineTitlePage({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15),
              child: Text(
                text,
                style: GoogleFonts.josefinSlab(
                  color: Colors.black87,
                  fontSize: 36,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
