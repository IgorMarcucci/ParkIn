import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void erro(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: FittedBox(
        child: Text(
          msg,
          style: GoogleFonts.josefinSlab(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
void sucesso(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: FittedBox(
        child: Text(
          msg,
          style: GoogleFonts.josefinSlab(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}