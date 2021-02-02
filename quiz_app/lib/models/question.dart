import 'package:quiz_app/models/answer.dart';

class Question{

  Question({this.answers, this.questionText,});

  String questionText;
  List<Answer> answers;
}