import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Models/func_interface_model.dart';

ChangeNotifierProvider funcInterfaceModelProvider =
    ChangeNotifierProvider<FuncInterfaceModel>(
  create: (context) => FuncInterfaceModel(
    vagasController: TextEditingController(),
    marcaController: TextEditingController(),
    placaController: TextEditingController(),
    modeloController: TextEditingController(),
  ),
);
