import 'package:json_annotation/json_annotation.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'chat_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.id,
    required super.content,
    required super.role,
    required this.chatConversationId,
    required this.userId,
    required this.createdAt,
  }) : super(
          chatConversationId: chatConversationId,
          userId: userId,
          createdAt: createdAt,
        );

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

  @override
  @JsonKey(name: 'chat_conversation_id')
  final String chatConversationId;

  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}
