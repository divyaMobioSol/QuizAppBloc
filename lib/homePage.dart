import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/bloc.dart';
import 'package:quiz_app/bloc/event.dart';
import 'package:quiz_app/bloc/state.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _totalScore = 0;
  // var result = false;

  _answerQuestion(int score) {
    _totalScore = _totalScore + score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: BlocConsumer<QuizBloc, QuestionState>(
        listener: (context, state) {
          // if ((state as QuestionLoaded).quiz[state.index].answers[1]['score'] ==
          //     5) {
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('Answer is correct'),
          //     duration: Duration(seconds: 3),
          //   ));
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('Answer is wrong'),
          //     duration: Duration(seconds: 3),
          //   ));
          //  }
        },
        builder: (context, state) {
          if (state is QuestionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuestionLoaded) {
            return state.index < state.quiz.length
                ? Quiz(
                    questions: state.quiz,
                    questionIndex: state.index,
                    answerQuestion: () =>
                        context.read<QuizBloc>().add(addScore()),
                    onTap: () {
                      context.read<QuizBloc>().add(nextQuestion());
                    })
                : Result(state.score,
                    () => context.read<QuizBloc>().add(resetQuestion()));
          }
          return Text('nkgn');
        },
      ),
    );
  }
}
