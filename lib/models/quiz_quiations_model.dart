class QuizQuestion{
  const QuizQuestion(this.text,this.answer);

  final String text;
  final List<String> answer;

  List<String> shuffeldAnswers(){
    final shuffeldanswerlist = List.of(answer);
    shuffeldanswerlist.shuffle();
    return shuffeldanswerlist;
  }
}