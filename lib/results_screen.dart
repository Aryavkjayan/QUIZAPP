import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';


class ResultsScreen extends StatelessWidget {
const ResultsScreen({
  super.key,
  required this.chosenAnswers,
  required this.onRestart,});

final void Function() onRestart;
final List<String> chosenAnswers;

List<Map<String, Object>> get SummaryData {
  final List<Map<String, Object>> Summary = [];

  for (var i = 0; i < chosenAnswers.length; i++){
    Summary.add({
      'question_index' : i,
      'question' : questions[i].text,
      'correct_answer' : questions[i].answers[0],
      'user_answer' : chosenAnswers[i]
    },
    );
  }

  return Summary;
}

 @override
  Widget build(BuildContext context) {
    
final numTotalQuestions = questions.length;
final numCorrectQuestions = SummaryData.where((data) {
  return data['user_answer'] == data['correct_answer'];
}).length;

   return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
         child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !'),
                 const SizedBox(height: 30,),
                 QuestionsSummary(SummaryData),
                 const SizedBox(height: 30,),
                 TextButton(
                  onPressed: onRestart, 
                  child: const Text('Restart Quiz!'),
                 )
            ],),
        
        
   ),
   );
  }
}