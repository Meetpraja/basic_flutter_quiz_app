import 'package:flutter/material.dart';
import 'package:quizapp/answerButton_style.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key,required, required this.selectedAnswer});

  final void Function(String answer) selectedAnswer;

  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentquestionindex = 0;

  void answeredquestion(String selectedanswer) {
    widget.selectedAnswer(selectedanswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentquestionindex];
    return Container(
        margin: EdgeInsets.all(35),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: Colors.red[100],
                    fontSize: 24,
                  ),
                   textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ...currentQuestion.shuffeldAnswers().map((e) {
                return AnswerButton(answertxt: e,
                    onTap: (){
                      answeredquestion(e);
                    });
              })
            ],
          ),
        ),
    );
  }
}
