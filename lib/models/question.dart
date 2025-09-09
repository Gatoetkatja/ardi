class Question {
  final String text;
  final List<Answer> answers;

  Question({
    required this.text,
    required this.answers,
  });
}

class Answer {
  final String text;
  final String learningStyle;
  final int weight;

  Answer({
    required this.text,
    required this.learningStyle,
    required this.weight,
  });
}

