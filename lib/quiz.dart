import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/bloc/event.dart';
import 'package:quiz_app/questionAnswerModel.dart';
import './question.dart';
import 'bloc/bloc.dart';

class Quiz extends StatelessWidget {
  final List<QuestionAnswer> questions;
  final int questionIndex;
  final void Function()? onTap;
  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex].questionText,
        ),

        //(questions[0]['answers'] )
        ...(questions[questionIndex].answers).map((answer) {
          return Answer(
              selectHandler: () {
                print(answer);

                context
                    .read<QuizBloc>()
                    .add(AnswerQuestions(answer: answer, context: context));

                print(answer['score']);
              },
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
