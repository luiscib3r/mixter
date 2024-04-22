// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llm_api_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LlmApiModelAdapter extends TypeAdapter<LlmApiModel> {
  @override
  final int typeId = 3;

  @override
  LlmApiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LlmApiModel()
      ..name = fields[0] as String
      ..url = fields[1] as String
      ..apiKey = fields[2] as String?
      ..modelId = fields[3] as String
      ..type = fields[4] as LlmApiModelType
      ..provider = fields[5] as LlmApiProviderModel;
  }

  @override
  void write(BinaryWriter writer, LlmApiModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.apiKey)
      ..writeByte(3)
      ..write(obj.modelId)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.provider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LlmApiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LlmApiModelTypeAdapter extends TypeAdapter<LlmApiModelType> {
  @override
  final int typeId = 1;

  @override
  LlmApiModelType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LlmApiModelType.openai;
      default:
        return LlmApiModelType.openai;
    }
  }

  @override
  void write(BinaryWriter writer, LlmApiModelType obj) {
    switch (obj) {
      case LlmApiModelType.openai:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LlmApiModelTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LlmApiProviderModelAdapter extends TypeAdapter<LlmApiProviderModel> {
  @override
  final int typeId = 2;

  @override
  LlmApiProviderModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LlmApiProviderModel.openai;
      case 1:
        return LlmApiProviderModel.groq;
      case 2:
        return LlmApiProviderModel.customOpenai;
      default:
        return LlmApiProviderModel.openai;
    }
  }

  @override
  void write(BinaryWriter writer, LlmApiProviderModel obj) {
    switch (obj) {
      case LlmApiProviderModel.openai:
        writer.writeByte(0);
        break;
      case LlmApiProviderModel.groq:
        writer.writeByte(1);
        break;
      case LlmApiProviderModel.customOpenai:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LlmApiProviderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
