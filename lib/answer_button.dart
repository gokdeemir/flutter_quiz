import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  const AnswerButton(this.answerText, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
