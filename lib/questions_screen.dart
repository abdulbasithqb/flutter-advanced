import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/answer_button.dart';
import 'package:flutter_advanced/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSreeen extends StatefulWidget {
  QuestionSreeen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionSreeenState();
  }
}

class _QuestionSreeenState extends State<QuestionSreeen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    void answerQuestion(String answer) {
      widget.onSelectAnswer(answer);
      setState(() {
        currentQuestionIndex++;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
