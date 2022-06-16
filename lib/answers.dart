import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer({required this.selectHandler, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.white,
            ),
            child: Text(answerText),
            onPressed:
                //         (state as QuestionLoaded).quiz[state.index].answers.map((e) {
                //   if (e['result'] == true) {
                //     print(e);
                //   }
                //   //print(e);
                // }).toList();
                selectHandler,
          )),
    );
  }
}
