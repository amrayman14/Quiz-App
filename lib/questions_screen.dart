import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/dummy_data.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }

}

class _QuestionsScreen extends State<QuestionsScreen>{

  var currentAnswerIndex = 0;
  void incrementCurrentAnswer(String answer){
    setState(() {
      widget.onSelectedAnswer(answer);
      currentAnswerIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentAnswer = questions[currentAnswerIndex];
    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Center(
               child: Text(currentAnswer.text,
                         style: GoogleFonts.lato(
                           color: const Color.fromARGB(255, 201, 153, 251),
                           fontSize: 24,
                           fontWeight: FontWeight.bold,
                         ),
                          textAlign: TextAlign.center,
                         ),
             ),
            const SizedBox(height: 30),
            ...currentAnswer.shuffledData().map((answer){
              return AnswerButton(text: answer, onTap: (){
                incrementCurrentAnswer(answer);
              });
            },
            )
          ],
        ),
      ),
    );
  }

}