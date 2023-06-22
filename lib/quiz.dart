import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/results_screen.dart';


class Quiz extends StatefulWidget {
  Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }

}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';

 

  void  switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

  if (_selectedAnswers.length == questions.length) {
    setState(() {
     
      activeScreen = 'results-screen' ;
    });

  }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }


  @override
  Widget build(context){
   Widget  screenWidget = StartScreen(switchScreen);

   if (activeScreen == 'questions-screen')  {
     screenWidget =  QuestionsScreen(
      onSelectAnswer: chooseAnswer,
      );  
   }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart : restartQuiz,
        );
    }
   

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 19, 189),
                 Color.fromARGB(255, 133, 100, 189),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              ),
          child: screenWidget,
          ),
        ),
        );
  }
}