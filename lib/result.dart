import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are bad!';
    } else if (resultScore <= 20) {
      resultText = 'You are strange!';
    } else if (resultScore <= 25) {
      resultText = 'You are pretty likeable!';
    } else {
      resultText = 'You are awesome!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '$resultScore',
            style: const TextStyle(color: Colors.pink, fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
