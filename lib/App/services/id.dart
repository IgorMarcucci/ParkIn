import 'dart:math';

String generateShortUniqueId() {
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

  String random = Random().nextInt(10000).toString().padLeft(4, '0');

  String uniqueId = '$timestamp$random';

  return uniqueId;
}