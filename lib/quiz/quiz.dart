import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';
import 'score.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  final quiz = [
    {
      "question": "Q 1 - In Java 8, which method is used to combine multiple `Predicate` instances?",
      "answers": [
        {
          "answer": "A - and()",
          "correct": true
        },
        {
          "answer": "B - or()",
          "correct": false
        },
        {
          "answer": "C - not()",
          "correct": false
        },
        {
          "answer": "D - combine()",
          "correct": false
        }
      ]
    },
    {
      "question": "Q 2 - Which of the following functional interfaces is used to represent a function that accepts two arguments and produces a result in Java 8?",
      "answers": [
        {
          "answer": "A - Function<T, R>",
          "correct": false
        },
        {
          "answer": "B - BiFunction<T, U, R>",
          "correct": true
        },
        {
          "answer": "C - Consumer<T>",
          "correct": false
        },
        {
          "answer": "D - Supplier<T>",
          "correct": false
        }
      ]
    }

  ];

  void answerQuestion(bool correct) {
    if (correct) score++;

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex < quiz.length) {
      return Column(
        children: [
          Question(quiz[currentQuestionIndex]['question'] as String),
          ...(quiz[currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
            return Answer(() => answerQuestion(answer['correct'] == true), answer['answer'] as String);
          }).toList(),
        ],
      );
    } else {
      return Score(score, resetQuiz,quiz.length);
    }
  }
}