import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/quiz.dart';
import 'package:quiz_app/widgets/result.dart';
import './models/question.dart' as modelQuestion;
import './models/answer.dart' as modelAnswer;


void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<modelQuestion.Question> _questions = List();

  @override
  void initState() {
    _questions.add(
      modelQuestion.Question(questionText: "Prvo pitanje",
      answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ] ),
    );
        _questions.add(
      modelQuestion.Question(
        questionText: "Drugo pitanje",
        answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ]
      ),
    );    
    _questions.add(
      modelQuestion.Question(
        questionText: "Trece pitanje",
        answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ]
      ),
    );
    super.initState();
  }

  var _questionIndex=0;
  var _totalScore = 0;

  void _answerQuestion(int score){
        _totalScore += score;

        setState(() {
          _questionIndex = _questionIndex + 1;
        });

        print("index: $_questionIndex");
        print("score: $_totalScore");
  }

  void resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: _questionIndex < _questions.length ?
            Quiz(questions: _questions, questionIndex: _questionIndex, answerQuestion: _answerQuestion,) :
            Result(resetHandler: resetQuiz, resultScore: _totalScore,),
        ),
        theme: ThemeData(primaryColor: Colors.amber),
    );
  }
}
