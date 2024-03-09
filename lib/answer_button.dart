import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({
    required this.text,
    required this.onTap,
    super.key
  });
  final String text ;
  final void Function() onTap ;
  @override
  Widget build(BuildContext context) {
  return Container(
    margin:const EdgeInsets.all(5),
    child: ElevatedButton(
      onPressed:onTap ,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(vertical:10,horizontal: 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
      ),

      textAlign: TextAlign.center,
      ),
    ),
  );
  }
}