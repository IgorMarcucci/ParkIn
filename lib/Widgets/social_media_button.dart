import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({Key? key, required this.icon}) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: FittedBox(
            child: Text(
              'Redes sociais em desenvolvimento!',
              style: GoogleFonts.josefinSlab(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ));
      },
      child: Image(
        color: Colors.black87,
        image: AssetImage(icon),
        height: MediaQuery.of(context).size.height * 0.06,
        isAntiAlias: true,
      ),
    );
  }
}
