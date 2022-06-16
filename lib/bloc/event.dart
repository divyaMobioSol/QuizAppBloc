import 'package:flutter/cupertino.dart';

abstract class QuestionEvent {}

class loadQuestions extends QuestionEvent {}

class nextQuestion extends QuestionEvent {}

class resetQuestion extends QuestionEvent {}

class AnswerQuestions extends QuestionEvent {
  final Map<String, dynamic> answer;
  BuildContext context;
  AnswerQuestions({required this.answer, required this.context});
}

//class addScore extends QuestionEvent {}
