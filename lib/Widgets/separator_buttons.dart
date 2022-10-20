import 'package:flutter/material.dart';

class SeparatorButtons extends StatelessWidget {
  const SeparatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: 0.4,
      width: MediaQuery.of(context).size.width * 0.3,
    );
  }
}
