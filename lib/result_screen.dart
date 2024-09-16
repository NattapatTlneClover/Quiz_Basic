import 'package:flutter/material.dart';
import 'package:quiz/question_summary.dart';
import 'package:quiz/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.onStartQuizAgain, required this.chosenAnswers, super.key});
  final void Function() onStartQuizAgain;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    //Logic
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    //UI
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestions questoins correctly!",
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //const Text('List of answers and questions...'),
            QuestionSummary(
              summaryData: getSummaryData(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: onStartQuizAgain,
              label: const Text(
                "restart-Quiz!",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
