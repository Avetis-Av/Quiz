import 'package:flutter/material.dart';
import 'package:quiz/UI/question_text.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/cw_over.dart';

import 'last_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currQ;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);

  String qText;
  int qNum;
  bool isCorrect;
  bool visOlay = false;

  @override
  void initState() {
    super.initState();
    currQ = quiz.nextQuestion;
    qText = currQ.question;
    qNum = quiz.qNum;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currQ.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      visOlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // true button
            new QuestionText(qText, qNum),
            new AnswerButton(false, () => handleAnswer(false)), // false button
          ],
        ),
        visOlay
            ? new CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == qNum) {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ScorePage(quiz.score, quiz.length)),
                      (Route route) => route == null);
                  return;
                }
                currQ = quiz.nextQuestion;
                this.setState(() {
                  visOlay = false;
                  qText = currQ.question;
                  qNum = quiz.qNum;
                });
              })
            : new Container()
      ],
    );
  }
}
