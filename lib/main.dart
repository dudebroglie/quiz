import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int score = 0;
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': '10'},
        {'text': 'Red', 'score': '5'},
        {'text': 'Green', 'score': '3'},
        {'text': 'White', 'score': '1'},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': '3'},
        {'text': 'Snake', 'score': '11'},
        {'text': 'Elephant', 'score': '5'},
        {'text': 'Lion', 'score': '9'},
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': '1'},
        {'text': 'Max', 'score': '1'},
        {'text': 'Max', 'score': '1'},
        {'text': 'Max', 'score': '1'},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool = false;
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more question! ');
    } else {
      print('NO More Question!');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = const ['hello'];
    //dummy.add('Max');
    //print(dummy);
    //dummy = [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first shapp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
