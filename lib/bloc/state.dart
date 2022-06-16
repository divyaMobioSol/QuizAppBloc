import 'package:quiz_app/question.dart';
import 'package:quiz_app/questionAnswerModel.dart';
import 'package:quiz_app/quiz.dart';

abstract class QuestionState {
  const QuestionState();
}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<QuestionAnswer> quiz;
  int index;
  int totalScore;

  QuestionLoaded({
    required this.index,
    required this.quiz,
    required this.totalScore,
  });
}

class QuestionError extends QuestionState {}
