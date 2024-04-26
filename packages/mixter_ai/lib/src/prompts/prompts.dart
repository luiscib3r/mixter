abstract class MixterPrompts {
  static const generateTitlePrompt = _generateTitlePrompt;
}

const _generateTitlePrompt = '''
---BEGIN Conversation---
{conversation}
---END Conversation---
Summarize the conversation in 5 words or fewer:
Be as concise as possible without losing the context of the conversation.
Your goal is to extract the key point of the conversation.
''';
