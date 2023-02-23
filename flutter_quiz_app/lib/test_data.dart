import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';

class TestData {
  int _questionIndex = 0;

  List<Question> questions = [
    Question(
        question:
            'It is mandatory to define constraint for each attribute of a table.',
        answer: false),
    Question(
        question: 'Each table can contain more than one primary key.',
        answer: false),
    Question(
        question:
            'Unique constraints ensures that all the values in a column are distinct/unique.',
        answer: true),
    Question(
        question:
            'The result of a SELECT statement can contain duplicate rows.  ',
        answer: true),
    Question(
        question:
            'Primary Key does allow the Null Values. where as in Unique key does not accept the Null values',
        answer: false),
    Question(
        question: 'A NULL value is treated as a blank or zero.', answer: false),
    Question(
        question:
            'By default, each attribute can take NULL values except for the primary key.',
        answer: true),
  ];

  String getQuestion() {
    return questions[_questionIndex].question;
  }

  bool getAnswer() {
    return questions[_questionIndex].answer;
  }

  void nextQuestion() {
    if (_questionIndex + 1 < questions.length) {
      _questionIndex++;
    }
  }

  bool isEnd() {
    if (_questionIndex + 1 >= questions.length) {
      return true;
    } else {
      return false;
    }
  }

  void restartTest() {
    _questionIndex = 0;
  }

  List<Widget> answerKey = [];
}
