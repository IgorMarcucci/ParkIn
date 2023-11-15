import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/App/Keys/keys.dart';
import 'package:flutter_app/App/Providers/providers.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/App/theme/theme.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await Hive.openBox('userData');
  await Hive.openBox('parkData');
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const ParkIn(),
    ),
  );
}
Keys keys = Keys();
NumberFormat formatValue = NumberFormat("#,##0.00", "pt_BR");
DateFormat formatDate = DateFormat("dd/MM/yyyy");
DateFormat formatHour = DateFormat('HH:mm');

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
