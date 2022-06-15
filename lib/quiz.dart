import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/questionAnswerModel.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<QuestionAnswer> questions;
  final int questionIndex;
  final Function answerQuestion;
  final void Function()? onTap;
  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.answerQuestion,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          (questions[questionIndex].questionText as String),
        ),

        //(questions[0]['answers'] )
        ...(questions[questionIndex].answers as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              selectHandler: () => answerQuestion(answer['score']),
              //  await answerQuestion(answer['result']);

              answerText: answer['text'] as String);
        }).toList(),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              color: Colors.purple,
              onPressed: onTap,
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
