import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/questions_screen.dart';
import 'package:flutter_quiz/screens/result_screen.dart';

import 'data/questions.dart';
import 'screens/landing.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  _Screens _activeScreen = _Screens.startScreen;

  void switchScreen() {
    setState(() {
      _activeScreen = _Screens.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = _Screens.resultsScreen;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = _Screens.startScreen;
      _selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    if (_activeScreen == _Screens.questionsScreen) {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (_activeScreen == _Screens.startScreen) {
      screenWidget = Landing(switchScreen);
    } else {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.center,
            ),
          ),
          child: screenWidget,
        ),
        backgroundColor: const Color.fromRGBO(86, 3, 168, 1),
      ),
    );
  }
}

enum _Screens { questionsScreen, startScreen, resultsScreen }
