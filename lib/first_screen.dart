import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget{
   const FirstScreen(this.switchScreen,{super.key});

  final Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.6,
                child: Image.asset('assets/images/quiz-logo.png',
                width: 300,),
            ),
            const SizedBox(height: 35),
            const Text('Learn Flutter the fun way!',
              style: TextStyle(fontSize: 18,color: Colors.white,),
            ),
            const SizedBox(height: 35),
            OutlinedButton.icon(onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder()
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start quiz'),
            ),
          ],
      ),
    );
  }

}