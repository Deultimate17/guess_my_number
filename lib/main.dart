import 'package:flutter/material.dart';
import 'package:guess_my_number_app/guess_number.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark
        ),
        title: 'Guess My App',
        home: GuessNumber(),
      )
  );
}
