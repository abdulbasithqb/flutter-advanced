import 'package:flutter/material.dart';
import 'package:flutter_advanced/questions_screen.dart';
import 'package:flutter_advanced/start_screen.dart';


class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

String? activeScreen =  'start-screen';


void SwitchScreen() {
  setState(() {
    activeScreen = 'question-screen';
  });
}

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 8, 253),
                Color.fromARGB(255, 134, 132, 245),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen == 'start-screen' ? StartScreen(SwitchScreen) : QuestionSreeen(),
        ),
      ),
    );
  }
}
