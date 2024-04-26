import 'package:langchain/langchain.dart';
import 'package:mixter_agent/mixter_agent.dart';

class ReActAgent {
  ReActAgent({
    required this.systemPrompt,
    required this.llm,
    required this.formatter,
    required this.parser,
  });

  final String systemPrompt;
  final BaseChatModel llm;
  final ReActChatFormatter formatter;
  final ReActOutputParser parser;

  Future<String> chat(String message) async {
    final system = PromptTemplate.fromTemplate(systemPrompt);

    final chain = LLMChain(
      llm: llm,
      prompt: system,
      outputParser: const StringOutputParser(),
    );

    final response = await chain.run({
      'tool_desc': 'Calculator(int a, int b)',
      'tool_names': ['Calculator'],
      'input': message,
    });

    return response;
  }
}
