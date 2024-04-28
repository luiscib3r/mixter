abstract class MixterPrompts {
  static const generateTitlePrompt = _generateTitlePrompt;
}

const _generateTitlePrompt = '''
Conversation:

{conversation}

Summarize the conversation in 5 (five) words or fewer.
Use just one sentence.
Be as concise as possible without losing the context of the conversation.
''';
