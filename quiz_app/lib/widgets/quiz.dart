
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer.dart';
import 'package:quiz_app/widgets/question.dart';

import '../models/question.dart' as modelquestion;

class Quiz extends StatelessWidget{
  List<modelquestion.Question> questions;
  int questionIndex;
  Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex].questionText),
        Expanded(
          child: ListView.builder(
            itemCount: questions[questionIndex].answers.length,
            itemBuilder: (BuildContext buildContext, int index){
             return Answer(
                  () => answerQuestion(
                      questions[questionIndex].answers[index].score),
                  questions[questionIndex].answers[index].text);
            }
          ),
        ),
      ],
    );
  }

}