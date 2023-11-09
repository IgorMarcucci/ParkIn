// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => VerificationState();
}

class VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    // ignore: no_leading_underscores_for_local_identifiers
    bool _onEditing = true;
    // ignore: no_leading_underscores_for_local_identifiers
    String? _code;
    return Column(
      children: [
        VerificationCode(
          itemSize: 40,
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black87, fontSize: 24),
          keyboardType: TextInputType.number,
          underlineColor: const Color.fromARGB(255, 89, 89, 89),
          length: 6,
          cursorColor: Colors.black87,
          clearAll: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Container(
              decoration: tema.decorationbox,
              height: MediaQuery.of(context).size.height * 0.042,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Center(
                child: Text(
                  'Limpar tudo',
                  style: GoogleFonts.josefinSlab(
                      fontSize: 22.0,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 2),
          onCompleted: (String value) {
            setState(() {
              _code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              _onEditing = value;
            });
            if (!_onEditing) FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
