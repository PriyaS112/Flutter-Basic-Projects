import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants.dart';
import 'package:flutter_quiz_app/test_data.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  TestData test1 = TestData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Quiz App'),
        ),
        backgroundColor: Colors.blue[200],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      test1.getQuestion(),
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 2,
                  spacing: 2,
                  children: test1.answerKey,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                buttonFunction(false);
                              },
                              child: Icon(Icons.thumb_down),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(50, 50),
                                primary: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                buttonFunction(true);
                              },
                              child: Icon(Icons.thumb_up),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(50, 50),
                                primary: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buttonFunction(bool choosenIcon) {
    if (test1.isEnd() == true) {
      trueFalseControl(choosenIcon);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("END"),
            content: const Text("You have finished the test."),
            actions: <Widget>[
              TextButton(
                child: const Text("Try again"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test1.restartTest();
                    test1.answerKey = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      trueFalseControl(choosenIcon);
    }
  }

  void trueFalseControl(bool choosenIcon) {
    setState(
      () {
        test1.getAnswer() == choosenIcon
            ? test1.answerKey.add(kTrueIcon)
            : test1.answerKey.add(kFalseIcon);
        test1.nextQuestion();
      },
    );
  }
}
