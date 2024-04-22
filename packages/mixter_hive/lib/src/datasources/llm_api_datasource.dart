import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mixter_hive/src/datasources/datasources.dart';
import 'package:mixter_hive/src/models/models.dart';

class LlmApiDataSource extends HiveDataSource {
  Box<LlmApiModel>? _box;

  Future<Box<LlmApiModel>> get _llmApiBox async {
    if (_box != null) {
      return _box!;
    }

    final secureKey = base64Url.decode(await key);

    _box = await Hive.openBox<LlmApiModel>(
      'llmApi',
      encryptionCipher: HiveAesCipher(secureKey),
    );

    return _box!;
  }

  Future<void> setLlmApi(LlmApiModel api) async {
    final box = await _llmApiBox;

    await box.put('llmApi', api);
  }

  Future<LlmApiModel?> getLlmApi() async {
    final box = await _llmApiBox;

    return box.get('llmApi');
  }
}
