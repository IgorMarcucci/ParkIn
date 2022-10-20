import 'package:flutter/material.dart';
import 'package:flutter_app/App/Providers/providers.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/App/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const ParkIn(),
    ),
  );
}
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ParkIn extends StatelessWidget {
  const ParkIn({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ParkIn",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: themeData(),
    );
  }
}
