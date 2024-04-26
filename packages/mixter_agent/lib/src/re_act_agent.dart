// ignore_for_file: lines_longer_than_80_chars

import 'package:langchain/langchain.dart';
import 'package:mixter_agent/mixter_agent.dart';
import 'package:mixter_agent/src/mixter_agent.dart';

class ReActAgent {
  ReActAgent({
    required this.systemPrompt,
    required this.llm,
    this.formatter = const ReActChatFormatter(),
    this.parser = const ReActOutputParser(),
    this.maxIterations = 10,
  });

  final String systemPrompt;
  final BaseChatModel llm;
  final ReActChatFormatter formatter;
  final ReActOutputParser parser;
  final int maxIterations;

  Future<String> chat(String message) async {
    final system = PromptTemplate.fromTemplate(systemPrompt).format({
      'tool_desc': '',
      'tool_names': <String>[],
    });

    final conversation = <ChatMessage>[
      ChatMessage.system(system),
      ChatMessage.humanText(message),
    ];

    var response = '';

    for (var i = 0; i < maxIterations; i++) {
      final result = await llm.invoke(PromptValue.chat(conversation));

      response = result.outputAsString;
      conversation.add(result.output);

      if (response.contains('Answer:')) {
        return response;
      }
    }

    return response;
  }
}
