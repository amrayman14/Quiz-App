import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsSummary extends StatelessWidget{
   ResultsSummary(this.summaryData,{super.key});

  final List<Map<String , Object>> summaryData;

  Color? circleColor ;



  @override
  Widget build(context){
    return  SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
            summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CircleAvatar(
                          radius: 17,
                        backgroundColor: data['chosen_answer'] as String
                            == data['correct_answer'] as String?
                      Colors.cyan : Colors.redAccent
                      ,
                        child: Text(((data['question_index'] as int) + 1).toString()
                        ),

                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),

                        ),
                        const SizedBox(height: 5,),
                        Text(data['chosen_answer'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.redAccent,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 5,),
                        Text(data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList()

        ),
      ),
    );
  }



}