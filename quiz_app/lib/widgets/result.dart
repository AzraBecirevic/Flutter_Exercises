

import 'package:flutter/material.dart';

class Result extends StatelessWidget{

   Function resetHandler;
   int resultScore;

   Result({this.resetHandler, this.resultScore});

   @override
  Widget build(BuildContext context) {
   return Container(
     child: Center(
       child: Column(
         children: [
           Text(
             'Result: ${this.resultScore}',
             style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
           ),
           FlatButton(
             onPressed: resetHandler,
             child: Text('Restart Quiz'),
             textColor: Colors.blue,
           ),
         ],
       ),
     ),
   );
  }

}