import 'package:expensetrackerapp/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));
    

void main() {
  
runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            cardTheme: const CardTheme().copyWith(
                color: kDarkColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kDarkColorScheme.onSecondaryContainer,
                    fontSize: 20))),
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 20))),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const Exprenses(),
      ),
    );
  
}
