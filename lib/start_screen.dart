import 'package:flutter/material.dart';



class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});


  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(120, 255, 254, 254),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Welcome",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: const Text('Start Quiz Now'),
            icon: const Icon(Icons.arrow_right),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 1, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
