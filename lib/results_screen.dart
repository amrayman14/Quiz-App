import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/dummy_data.dart';
import 'package:quiz_app/results_summary.dart';

class ResultsScreen extends StatelessWidget{

     ResultsScreen({super.key,required this.chosenAnswer,required this.onRestart});
  final List<String> chosenAnswer;
     List<Map<String, Object>> summary = [];
     final void Function() onRestart;

   List<Map<String , Object>> getSummaryData(){
     final List<Map<String , Object>> summary = [];

     for (var i=0 ; i<chosenAnswer.length ; i++){
        summary.add({
          'question_index': i,
          'question':questions[i].text,
          'chosen_answer':chosenAnswer[i],
          'correct_answer':questions[i].answers[0]
        },);
    }
     return summary;
}



  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = summaryData.length;
    final correctAnswers = summaryData.where((data){
      return data['chosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Answered $correctAnswers of $totalQuestions questions correctly',
            style:  GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 251),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
        const SizedBox(height: 30,),
        ResultsSummary(summaryData),
        const SizedBox(height: 30,),
        TextButton.icon(onPressed: onRestart,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.restart_alt),
          label: const Text('Restart quiz!'),
        )
      ],
          ),
        ),
    );
  }
}