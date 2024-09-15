import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  //var // Declare but don't initialize here
  late final void Function() _startQuiz = widget.startQuiz;

  @override
  Widget build(context) {
    return Column(
      //column & row section 56
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 200,
          //color: Colors.red,
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     "assets/images/quiz-logo.png",
        //     width: 200,
        //   ),
        // ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: _startQuiz,
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
            //padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        ),
      ],
    );
  }
}
