import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

quiz_brain qzbrain=quiz_brain();
int p=0,max=1;
void fun() async{
  final fn='/data.txt';
  var file= await File(fn).writeAsString(max.toString());
}
void main() {
  fun();
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text('Quiz Game')),
          ),
        body: SafeArea(
          child: Quizpage(),
        ),
      ),
    );
  }
}
class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> score_keeper=[];
  void check_answer(int userpickedanswer){
    int correctanswer=qzbrain.get_answer();

    setState(() {


      if(qzbrain.check_finished()==true){
        if(userpickedanswer==correctanswer){
          p++;
        }
        if(p>=max){
          max=p;
        }
        Alert(
          context:context,
          title:'Finished',
          desc: 'You\'ve finished the quiz! '
              'Your Score- $p',
          buttons: [
        DialogButton(
        child: Text(
        "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      onPressed: () => Navigator.pop(context),
      width: 120,
      )
      ],
        ).show();
        qzbrain.reset();
        p=0;
        score_keeper=[];
      }
      else{
        if(userpickedanswer==correctanswer){
          p++;
          score_keeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
        else{
          score_keeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qzbrain.next_question();

      }
    });


  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Text(
                '💫Best Score-$max',

                style: TextStyle(

                  color: Colors.white,
                  fontSize: 20,
                ),

              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                qzbrain.get_question(),
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(minWidth: 400,
            color: Colors.blueAccent,
            child: Text(
              qzbrain.op1(),
              style: TextStyle(
                  color: Colors.white,
              ),
            ),
            onPressed: (){
              check_answer(1);
            },
          ),
        )),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            minWidth: 400,
            color: Colors.deepOrange,
            child: Text(
              qzbrain.op2(),
              style: TextStyle(
                  color: Colors.white,
              ),
            ),
            onPressed: (){
              check_answer(2);

            },
          ),
        )),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(minWidth: 400,
            color: Colors.teal,
            child: Text(
              qzbrain.op3(),
              style: TextStyle(
                  color: Colors.white,
              ),
            ),
            onPressed: (){
              check_answer(3);
            },
          ),
        )),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(minWidth: 400,
            color: Colors.pink,
            child: Text(
              qzbrain.op4(),
              style: TextStyle(
                  color: Colors.white,
              ),
            ),
            onPressed: (){
              check_answer(4);
            },
          ),
        )),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: score_keeper,
          ),
        )
      ],
    );
  }
}