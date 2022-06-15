import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/event.dart';
import 'package:quiz_app/bloc/state.dart';
import 'package:quiz_app/quiz.dart';

import '../questionAnswerModel.dart';

class QuizBloc extends Bloc<QuestionEvent, QuestionState> {
  QuizBloc() : super(QuestionLoading()) {
    final List<QuestionAnswer> _questions = [
      QuestionAnswer(answers: [
        {'text': 'Red', 'score': 5, 'result': true},
        {'text': 'Black', 'score': 10, 'result': false},
        {'text': 'Green', 'score': 8, 'result': false},
        {'text': 'Blue', 'score': 6, 'result': false},
      ], questionText: 'What\'s your favourite color?'),
      QuestionAnswer(
        questionText: 'What\'s your favourite animal?',
        answers: [
          {'text': 'Cat', 'score': 8, 'result': false},
          {'text': 'Dog', 'score': 10, 'result': false},
          {'text': 'Rabbit', 'score': 7, 'result': true},
          {'text': 'Squirell', 'score': 5, 'result': false},
        ],
      ),
      QuestionAnswer(
        questionText: 'Who\'s your favourite singer?',
        answers: [
          {'text': 'Sia', 'score': 8, 'result': false},
          {'text': 'Adam', 'score': 9, 'result': false},
          {'text': 'Alan', 'score': 5, 'result': false},
          {'text': 'Shawn', 'score': 6, 'result': true},
        ],
      ),
    ];

    int totalScore = 0;

    on<loadQuestions>((event, emit) async {
      await Future<void>.delayed(Duration(seconds: 6));
      emit(QuestionLoaded(score: 0, index: 0, quiz: _questions));
    });

    on<nextQuestion>((event, emit) {
      if (state is QuestionLoaded) {
        final state = this.state as QuestionLoaded;
        emit(QuestionLoaded(
            score: (state as QuestionLoaded).score + totalScore,
            index: (state as QuestionLoaded).index + 1,
            quiz: _questions));
      }
    });

    on<addScore>((event, emit) {
      if (state is QuestionLoaded) {
        final state = this.state as QuestionLoaded;
        emit(QuestionLoaded(
            score: (state as QuestionLoaded).score + totalScore,
            index: (state as QuestionLoaded).index + 1,
            quiz: _questions));
      }
    });

    on<resetQuestion>((event, emit) {
      if (state is QuestionLoaded) {
        final state = this.state as QuestionLoaded;
        emit(QuestionLoaded(score: 0, index: 0, quiz: _questions));
      }
    });
  }
}
