import 'package:flutter_app/App/controllers/fields.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider fieldsProvider =
    ChangeNotifierProvider<FieldsController>(
  create: (context) => FieldsController(),
);
