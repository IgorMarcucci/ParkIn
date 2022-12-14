import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/Pages/ResetPassword/SendEmailPage/send_email_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordResetButton extends StatelessWidget {
  const PasswordResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.read<LoginController>();
    return Container(
      height: 42,
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          loginController.clearControllers();
          Future.microtask(() {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const PasswordResetPage()),
                (route) => false);
          });
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
