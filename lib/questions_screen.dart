import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/answer_button.dart';

class QuestionSreeen extends StatefulWidget {
  QuestionSreeen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionSreeenState();
  }
}

class _QuestionSreeenState extends State<QuestionSreeen> {
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The Questions', style: TextStyle(
            color: Colors.white
          ),),
          SizedBox(height: 20),
         AnswerButton('1234')
      
        ],
      ),
    );
    
  }
}
