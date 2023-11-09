import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/social_media_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';

class SocialArea extends StatelessWidget {
  const SocialArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Column(
      children: [
        Container(
            color: Colors.black87,
            height: 0.4,
            width: MediaQuery.of(context).size.width * 0.7),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
            child: Text(
          'Siga nossas redes sociais!',
          style: tema.textstyles,
        )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialMediaButton(
              icon: 'assets/facebook.png',
            ),
            SocialMediaButton(
              icon: 'assets/instagram.png',
            ),
          ],
        ),
      ],
    );
  }
}
