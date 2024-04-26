import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_settings.g.dart';

@JsonSerializable(explicitToJson: true)
class AgentSettings extends Equatable {
  const AgentSettings({
    required this.baseUrl,
    required this.apiKey,
    required this.modelId,
  });

  factory AgentSettings.fromJson(Map<String, dynamic> json) =>
      _$AgentSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AgentSettingsToJson(this);

  final String baseUrl;
  final String apiKey;
  final String modelId;

  @override
  List<Object?> get props => [baseUrl, apiKey, modelId];

  @override
  bool? get stringify => true;
}
