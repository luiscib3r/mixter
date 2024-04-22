import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixter_hive/src/models/models.dart';

export 'src/mixter_hive.dart';

Future<void> setupHive() async {
  const secureStorage = FlutterSecureStorage();

  final encryptionKeyString = await secureStorage.read(key: 'key');

  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }

  await Hive.initFlutter();

  Hive
    ..registerAdapter(LlmApiModelTypeAdapter())
    ..registerAdapter(LlmApiProviderModelAdapter())
    ..registerAdapter(LlmApiModelAdapter());
}
