import 'package:langchain/langchain.dart';
import 'package:mixter_bloc/mixter_bloc.dart' as bloc;

extension ChatMessageModelMapper on bloc.ChatMessage {
  ChatMessage get entity => switch (role) {
        bloc.UserRole.user => ChatMessage.humanText(content),
        bloc.UserRole.assistant => ChatMessage.ai(content),
        bloc.UserRole.system => ChatMessage.system(content),
      };
}
