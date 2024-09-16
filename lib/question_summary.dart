import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    //Logic
    // final bool allAnswersCorrect = summaryData.every((data) {
    //   return data['user_answer'] == data['correct_answer'];
    // });

    //UI
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: summaryData.map(
            (data) {
              //I just know declare var in UI
              // Variable to store the color
              Color circleColor;

              if (data['user_answer'] == data['correct_answer']) {
                circleColor =
                    const Color.fromARGB(255, 134, 245, 138); // Correct answer
              } else {
                circleColor = const Color.fromARGB(
                    255, 243, 130, 122); // Incorrect answer
              }

              // same issue as Column it's center by default
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: circleColor),
                    alignment: Alignment.center,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    //The reason why the text is still centered even though you've set TextAlign.
                    //left is because the Column widget aligns its children in the center by default.
                    //The TextAlign property only affects the alignment of the text within the available space of the Text widget,
                    //not how the Text widget itself is aligned within its parent.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 122, 121, 121),
                              fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 167, 245, 170),
                              fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
