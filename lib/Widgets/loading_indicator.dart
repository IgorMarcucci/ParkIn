import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      child: const CircularProgressIndicator(
        color: Color.fromARGB(255, 40, 133, 255),
      ),
    );
  }
}
