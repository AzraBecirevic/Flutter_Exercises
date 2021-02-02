import 'package:flutter/material.dart';

class Answer extends StatelessWidget{

    String answerText;
    Function selectHandler;

    Answer(this.selectHandler, this.answerText);

   @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }

}