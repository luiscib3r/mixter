import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:mixter_ai/src/mappers/mappers.dart';
import 'package:mixter_bloc/mixter_bloc.dart' as bloc;

class LlmRepositoryAi extends bloc.LlmRepository {
  const LlmRepositoryAi({
    required Future<bloc.LlmApi?> Function() llmApi,
  }) : _llmApi = llmApi;

  final Future<bloc.LlmApi?> Function() _llmApi;

  Future<BaseChatModel> _getLlm() async {
    final llmApi = await _llmApi();
    if (llmApi == null) {
      throw Exception('No LLM API found');
    }

    return ChatOpenAI(
      defaultOptions: ChatOpenAIOptions(
        model: llmApi.modelId,
      ),
      baseUrl: llmApi.url,
      apiKey: llmApi.apiKey,
    );
  }

  @override
  Stream<String> generateChatResponse(List<bloc.ChatMessage> history) async* {
    final llm = await _getLlm();
    final messages = history.map((e) => e.entity).toList();

    final stream = llm.stream(PromptValue.chat(messages));

    yield* stream.map((event) => event.outputAsString);
  }

  @override
  Future<bloc.Result<String>> generateChatTitle(
    List<bloc.ChatMessage> history,
  ) {
    // TODO: implement generateChatTitle
    throw UnimplementedError();
  }
}
