import 'package:expensetrackerapp/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer
          )
          ),
      debugShowCheckedModeBanner: false,
      home: const Exprenses(),
    ),
  );
}
