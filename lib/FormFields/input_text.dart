import 'package:flutter/material.dart';
import 'package:flutter_app/App/Validators/text_validate.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.controller,
    required this.text,
    required this.typetxt,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final Icon icon;
  final String text;
  final TextInputType typetxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: typetxt,
      decoration: InputDecoration(
        icon: icon,
        labelText: text,
      ),
      style: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),
      controller: controller,
      validator: (value) => textValidate(value!),
    );
  }
}
