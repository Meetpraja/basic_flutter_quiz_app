import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/components/quiz_questions.dart';
import 'package:quizapp/screens/startScreen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  //first approch

  // Widget? ActiveScreen;
  // @override
  // void initState() {
  //   ActiveScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }
  // void switchScreen(){
  //   setState(() {
  //     ActiveScreen = QuestionsScreen();
  //   });
  // }

  //second approch

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-questions';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'quiz-questions';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'quiz-questions') {
      screenWidget = QuestionsScreen(selectedAnswer: chooseAnswer);
    }
    if(activeScreen == 'result-screen'){
      screenWidget = Result_Screen(
          choosenanswers: selectedAnswer,
          onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'quizzes',
            style: GoogleFonts.notoSans(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Color.fromRGBO(246, 47, 96, 1.0),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(246, 47, 96, 1.0),
            Color.fromRGBO(255, 177, 153, 1.0)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
    ;
  }
}
