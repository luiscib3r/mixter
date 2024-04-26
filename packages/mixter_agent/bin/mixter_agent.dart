import 'dart:convert';
import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';
import 'package:mixter_agent/mixter_agent.dart';

Future<void> main() async {
  // Open system.md file
  final file = File('system.md');
  final systemPrompt = file.readAsStringSync();

  // Settings
  final settingsFile = File('settings.json');
  final settings = settingsFile.readAsStringSync();
  final agentSettings =
      AgentSettings.fromJson(json.decode(settings) as Map<String, dynamic>);

  // LLM
  final llm = ChatOpenAI(
    baseUrl: agentSettings.baseUrl,
    apiKey: agentSettings.apiKey,
    defaultOptions: ChatOpenAIOptions(model: agentSettings.modelId),
  );

  final agent = ReActAgent(
    systemPrompt: systemPrompt,
    llm: llm,
  );

  // final response = await agent.chat('What is 2123 * 215123');
  // print('\nRESPONSE');
  // print(response);

  final response2 = await agent.chat('Who is the president of LCL Company?');
  print('\nRESPONSE');
  print(response2);
}
