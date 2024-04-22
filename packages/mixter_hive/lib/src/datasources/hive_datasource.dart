// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HiveKeyNotFound implements Exception {
  const HiveKeyNotFound({
    this.message =
        'Hive secure key not found. Use setupHive method to generate a new key.',
  });
  final String message;
}

abstract class HiveDataSource {
  Future<String> get key async {
    const storage = FlutterSecureStorage();
    final key = await storage.read(key: 'key');

    if (key == null) {
      throw const HiveKeyNotFound();
    }

    return key;
  }
}
