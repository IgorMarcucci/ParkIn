import 'package:hive/hive.dart';

class StorageData {
  final _userDataBox = Hive.box('userData');
  final _parkDataBox = Hive.box('parkData');

  bool saveData(Map<String, dynamic> data, String name) {
    _userDataBox.put(name, data);
    var receiveData = _userDataBox.get(name);
    if (receiveData == data) {
      return true;
    } else {
      return false;
    }
  }

  bool removeData(String name) {
    _userDataBox.delete(name);
    var receiveData = _userDataBox.get(name);
    if (receiveData == null || !receiveData) {
      return true;
    } else {
      return false;
    }
  }

  readData(String name) {
    return _userDataBox.get(name);
  }

  bool saveParkData(Map<String, dynamic> data, String name) {
    _parkDataBox.put(name, data);
    var receiveData = _parkDataBox.get(name);
    if (receiveData == data) {
      return true;
    } else {
      return false;
    }
  }

  bool removeParkData(String name) {
    _parkDataBox.delete(name);
    var receiveData = _parkDataBox.get(name);
    if (receiveData == null || !receiveData) {
      return true;
    } else {
      return false;
    }
  }

  readParkData(String name) {
    return _parkDataBox.get(name);
  }
}
