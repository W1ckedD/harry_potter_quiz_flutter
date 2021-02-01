import 'package:flutter/material.dart';
import 'package:harry_potter_quiz/screens/quiz_screen.dart';
import 'package:harry_potter_quiz/screens/home_screen.dart';
import 'package:harry_potter_quiz/screens/result_screen.dart';

void main() => runApp(MyApp());
final pages = List.generate(10, (index) => index + 1);

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
