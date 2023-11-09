import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void message(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SizedBox(
        // color: ,
        height: 50,
        child: Center(
          child: AutoSizeText(
            msg,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            minFontSize: 6,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}