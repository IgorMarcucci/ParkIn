import 'package:hive/hive.dart';

class StorageData {
  final _dataBox = Hive.box('userData');

  bool saveData(Map<String, dynamic> data, String name) {
    _dataBox.put(name, data);
    var receiveData = _dataBox.get(name);
    if (receiveData == data) {
      return true;
    } else {
      return false;
    }
  }

  bool removeData(String name) {
    _dataBox.delete(name);
    var receiveData = _dataBox.get(name);
    if (receiveData == null || !receiveData) {
      return true;
    } else {
      return false;
    }
  }

  readData(String name) {
    return _dataBox.get(name);
  }
}
