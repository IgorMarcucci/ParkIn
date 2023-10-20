import 'package:flutter/material.dart';
import 'package:flutter_app/App/Keys/keys.dart';
import 'package:flutter_app/App/Providers/providers.dart';
import 'package:flutter_app/Views/Home/homepage.dart';
import 'package:flutter_app/App/Theme/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const ParkIn(),
    ),
  );
}

Keys keys = Keys();

class ParkIn extends StatelessWidget {
  const ParkIn({Key? key}) : super(key: key);

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
