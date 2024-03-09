import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy_data.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class QuizScreen extends StatefulWidget{
   const QuizScreen({super.key});
   @override
   State<StatefulWidget> createState() {
     return _QuizScreen();
   }

}

class _QuizScreen extends State<QuizScreen>{

  var activeScreen = 'start-screen';
   List<String> selectedAnswer = [];
  void switchScreen (){
    setState(() {
      activeScreen =  'questions-screen';

    });
  }
  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  void chosenAnswer (String answer){
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length){
      setState(() {
        activeScreen =  'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = FirstScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chosenAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswer,
          onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple,Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: screenWidget,
        ),
      ),
    );
  }

}