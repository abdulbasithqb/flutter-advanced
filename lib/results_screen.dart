import 'package:flutter/material.dart';
import 'package:flutter_advanced/data/questions.dart';
import 'package:flutter_advanced/models/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;
  final Function restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numbTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "You answered $numCorrectQuestions out of $numbTotalQuestion questions correctly!",
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionSummary(getSummaryData()),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              restartQuiz();
            },
            label: const Text('Restart'),
            icon: const Icon(Icons.restart_alt),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 1, color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
