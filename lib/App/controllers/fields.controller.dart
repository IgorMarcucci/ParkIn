import 'package:flutter/material.dart';

class FieldsController extends ChangeNotifier {
  bool loading = false;

  // FieldsController({this.loading});

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
