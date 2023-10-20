import 'package:flutter/material.dart';
import 'package:flutter_app/App/Keys/keys.dart';
import 'package:flutter_app/App/Providers/providers.dart';
import 'package:flutter_app/App/Routes/route.dart';
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
    return MaterialApp.router(
      title: "ParkIn",
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      theme: themeData(),
    );
  }
}
