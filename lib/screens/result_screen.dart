import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/components/questions_summary.dart';
import 'package:quizapp/components/quiz_questions.dart';

class Result_Screen extends StatelessWidget{
  Result_Screen({
    super.key,
    required this.choosenanswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> choosenanswers;

  List<Map<String, Object>> get summaryData{
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenanswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': choosenanswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
    )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'YOU ANSWERED $numCorrectQuestions OUT OF $numTotalQuestions QUESTIONS CORRECT',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
                onPressed:onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}