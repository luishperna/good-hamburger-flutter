import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonStorageService {
  final String fileName;

  JsonStorageService(this.fileName);

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<void> saveJson(Map<String, dynamic> jsonObject) async {
    try {
      final file = await _localFile;

      final jsonString = jsonEncode(jsonObject);

      await file.writeAsString(jsonString);

      print('✅ JSON successfully saved to: ${file.path}');
    } catch (e) {
      print('❌ Error saving JSON: $e');
    }
  }

  Future<Map<String, dynamic>?> readJson() async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        return null;
      }

      final jsonString = await file.readAsString();

      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
