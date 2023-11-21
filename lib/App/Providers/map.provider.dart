import 'package:flutter_app/App/controllers/map.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider mapProvider=
    ChangeNotifierProvider<MapController>(
  create: (context) => MapController(),
);
