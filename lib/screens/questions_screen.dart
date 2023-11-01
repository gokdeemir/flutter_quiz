import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = 0;

  @override
  void initState() {
    currentQuestion = 0;
    super.initState();
  }

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestion++;
      if (currentQuestion >= questions.length) {
        currentQuestion = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion].question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 249, 133, 241),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[currentQuestion]
                .shuffledAnswers
                .map((answer) => AnswerButton(
                      answer,
                      () {
                        answerQuestion(answer);
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
