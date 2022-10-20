import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/separator.dart';

class TextArea extends StatelessWidget {
  const TextArea(
      {Key? key,
      required this.topSize,
      required this.size,
      required this.secondCallback,
      required this.secondText,
      required this.callback,
      required this.text})
      : super(key: key);

  final String text;
  final Function callback;
  final String secondText;
  final Function secondCallback;
  final double size;
  final double topSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: topSize,
        ),
        MainButton(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.7,
          text: text,
          callback: callback,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Separator(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        MainButton(
          text: secondText,
          callback: secondCallback,
          height: 45,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        SizedBox(
          height: size,
        ),
      ],
    );
  }
}
