class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> get shuffledAnswers {
    final list = List.of(answers);
    list.shuffle();
    return list;
  }
}
