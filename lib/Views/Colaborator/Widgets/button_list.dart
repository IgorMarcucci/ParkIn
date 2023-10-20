import 'package:flutter/material.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({
    Key? key,
    required this.text,
    required this.callback,
    required this.height,
    required this.width,
    required this.secondText,
    required this.thirdText,
    required this.vagaCounter,
  }) : super(key: key);

  final String text;
  final Function callback;
  final double height;
  final double width;
  final String secondText;
  final String thirdText;
  final String vagaCounter;

  @override
  Widget build(BuildContext context) {
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      height: height,
      width: width,
      decoration: tema.decorationbox,
      child: SizedBox.expand(
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          onPressed: () {
            callback();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  Text(
                    'Placa: $text',
                    textAlign: TextAlign.start,
                    style: tema.textstylesTitleRodape,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Modelo: $secondText',
                    textAlign: TextAlign.start,
                    style: tema.textstyles,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Marca: $thirdText',
                    textAlign: TextAlign.start,
                    style: tema.textstyles,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                ],
              ),
              Text(
                ' V$vagaCounter',
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 66, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
