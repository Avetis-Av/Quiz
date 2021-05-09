import './questions.dart';

class Quiz {
  List<Question> _questions;
  int _currQI = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get score => _score;
  int get qNum => _currQI + 1;

  Question get nextQuestion {
    _currQI++;
    if (_currQI >= length) return null;
    return _questions[_currQI];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}
