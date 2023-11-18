import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/Pages/ResetPassword/SendEmailPage/send_email_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordResetButton extends StatelessWidget {
  const PasswordResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return Container(
      height: 42,
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          userController.clearControllers();
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const PasswordResetPage()),
                );
        },
        child: Text(
          'Recuperar Senha',
          style: GoogleFonts.josefinSlab(
            color: const Color.fromARGB(255, 26, 26, 26),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
