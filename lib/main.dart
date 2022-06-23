// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrian quizBrian = QuizBrian();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Page(),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List<Icon> ScoreKeeper = [];

  void Checkanswer(bool Userpick) {
    setState(() {
      if (quizBrian.isfinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrian.reset();
      } else {
        if (Userpick == quizBrian.GetAnswer()) {
          ScoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          ScoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }

      quizBrian.Nextquestion();
    });
  }
//   List<String> questions=[

//  'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//  'A slug\'s blood is green.',

//   ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Text(
                quizBrian.Getquestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            // padding: EdgeInsets.only(bottom: 15),
            onPressed: () {
              Checkanswer(true);
            },
            child: Container(
              child: Center(
                child: Text(
                  "True",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              color: Colors.green,
              height: 100,
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            //   padding: EdgeInsets.only(bottom: 15),
            onPressed: () {
              Checkanswer(false);
            },
            child: Container(
              child: Center(
                child: Text(
                  "False",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              color: Colors.red,
              height: 100,
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
