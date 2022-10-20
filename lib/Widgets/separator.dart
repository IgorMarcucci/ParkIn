import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black87,
              height: 0.4,
              width:
                  MediaQuery.of(context).size.width * 0.2
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.04,
            ),
            Text(
              'ou',
              style: GoogleFonts.josefinSlab(
                textStyle: const TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.04,
            ),
            Container(
              color: Colors.black87,
              height: 0.4,
              width:
                  MediaQuery.of(context).size.width * 0.2
            ),
          ],
    );
  }
}