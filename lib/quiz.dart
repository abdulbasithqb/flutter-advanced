import 'package:flutter/material.dart';
import 'package:flutter_advanced/data/questions.dart';
import 'package:flutter_advanced/questions_screen.dart';
import 'package:flutter_advanced/results_screen.dart';
import 'package:flutter_advanced/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String? activeScreen = 'start-screen';

  void SwitchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  _renderCurrentScreen(String activeScreen) {
    if (activeScreen == 'start-screen') {
      return StartScreen(SwitchScreen);
    } else if (activeScreen == 'question-screen') {
      return QuestionSreeen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      return ResultScreen(
          choosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    }
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
            child: _renderCurrentScreen(activeScreen!)),
      ),
    );
  }
}
