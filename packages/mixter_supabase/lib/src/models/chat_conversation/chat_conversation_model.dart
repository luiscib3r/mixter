import 'package:json_annotation/json_annotation.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'chat_conversation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatConversationModel extends ChatConversation {
  const ChatConversationModel({
    required super.id,
    required super.initialized,
    required this.userId,
    required this.createdAt,
    super.title,
  }) : super(userId: userId, createdAt: createdAt);

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatConversationModelToJson(this);

  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}
