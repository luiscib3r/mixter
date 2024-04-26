import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mixter_hive/src/datasources/datasources.dart';
import 'package:mixter_hive/src/models/models.dart';

class LlmApiLocalDataSource extends HiveDataSource {
  Box<String>? _box;

  Future<Box<String>> get _llmApiBox async {
    if (_box != null) {
      return _box!;
    }

    final secureKey = base64Url.decode(await key);

    await Hive.deleteBoxFromDisk('llmApi');

    _box = await Hive.openBox<String>(
      'llmApiV2',
      encryptionCipher: HiveAesCipher(secureKey),
    );

    return _box!;
  }

  Future<void> setLlmApi(LlmApiModel api) async {
    final box = await _llmApiBox;

    await box.put('llmApi', api.encode());
  }

  Future<LlmApiModel?> getLlmApi() async {
    final box = await _llmApiBox;

    final rawData = box.get('llmApi');

    if (rawData != null) {
      return LlmApiModel.decode(rawData);
    }

    return null;
  }
}
