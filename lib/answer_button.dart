import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText, {super.key});

  final String answerText;

  @override
  Widget build(context) {
    return ElevatedButton(onPressed: () {}, child: Text(answerText));
  }
}
