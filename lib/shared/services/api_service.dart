import 'dart:convert';

import 'package:flutter/services.dart';

import 'json_storage_service.dart';

class ApiService {
  static const String _baseUrl = 'api.good-hamburger.com';
  static const String _localMockPath = 'assets/mocks/data';

  /// Simulates an HTTP GET request by intercepting the URL and reading a local file.
  ///
  /// This method is designed for offline development or testing without a backend.
  ///
  /// **How it works:**
  /// 1. Waits for 1 second to simulate network latency.
  /// 2. Parses the provided [endpoint] (whether it is a full URL or a relative path).
  /// 3. Extracts the resource (e.g., `/menu`) and maps it to the corresponding JSON file
  ///    in the `assets/mocks/data/` folder.
  ///
  /// **Example:**
  /// * Input: `https://api.good-hamburger.com/menu` or just `/menu`
  /// * Output: Reads the file `assets/mocks/data/menu.json`
  ///
  /// Throws [Exception] if the file is not found or the JSON is invalid.
  Future<dynamic> get(String endpoint) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final Uri uri = Uri.parse(endpoint);
      final String resourcePath = uri.path.replaceAll(RegExp(r'^/'), '');
      final String assetPath = '$_localMockPath/$resourcePath.json';

      final String response = await rootBundle.loadString(assetPath);

      return json.decode(response);
    } catch (e) {
      throw Exception('Falha na API Mock ao acessar $endpoint: $e');
    }
  }

  /// Simula um HTTP POST request salvando os dados do [body] em um JSON local.
  ///
  /// O nome do arquivo local é determinado pelo [endpoint] (ex: '/order' salva em 'order.json').
  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final Uri uri = Uri.parse(endpoint);
      final String resourceName = uri.path.replaceAll(RegExp(r'^/'), '');
      final String fileName = '$resourceName.json';

      final storageService = JsonStorageService(fileName);
      await storageService.saveJson(body);

      return {'success': true, 'data': body};
    } catch (e) {
      throw Exception('Falha na API Mock ao enviar dados para $endpoint: $e');
    }
  }
}
