import 'package:expense_tracker/Widgets/expenses_widgets/expenses_screen.dart';
import 'package:flutter/material.dart';

var kLightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kLightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kLightColorScheme.primary,
            foregroundColor: kLightColorScheme.onPrimary),
        cardTheme: const CardTheme().copyWith(
          color: kLightColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kLightColorScheme.primary,
            foregroundColor: kLightColorScheme.onSecondary,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: kLightColorScheme.tertiary),
        ),
        iconTheme:
            const IconThemeData().copyWith(color: kLightColorScheme.primary),
      ),
      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.surfaceContainer,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkColorScheme.secondary,
            foregroundColor: kDarkColorScheme.onPrimary),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primary,
            foregroundColor: kDarkColorScheme.onSecondary,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: kDarkColorScheme.tertiary),
        ),
        iconTheme:
            const IconThemeData().copyWith(color: kDarkColorScheme.primary),
      ),
      themeMode: ThemeMode.system,
      home: const ExpensesScreen(),
    );
  }
}
