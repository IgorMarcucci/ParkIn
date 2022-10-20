import 'package:flutter/material.dart';
import 'package:flutter_app/FormFields/input_email.dart';

class ResetArea extends StatelessWidget {
  const ResetArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const InputEmail(
      icon: Icon(Icons.mail),
      text: 'Insira o email para verificação',
    );
  }
}