import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenstate();
  }
}

class _QuestionsScreenstate extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    //Logic
    final currentQuestion = questions[currentQuestionIndex];

    if (currentQuestionIndex > 4) {
      currentQuestionIndex == 0;
    }

    //UI
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //map section 71 shuffle 73
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
