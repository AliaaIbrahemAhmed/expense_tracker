import 'dart:math';

import 'package:expense_tracker/models/expense.dart';

class Utils {
  static List<Expense> generateDummyExpenses(int count) {
    final random = Random();
    final titles = {
      'Lunch': Category.food,
      'Flight': Category.travel,
      'Concert': Category.leisure,
      'Meeting': Category.work,
      'Coffee': Category.food,
      'Dinner': Category.food,
      'Hotel': Category.leisure,
      'Movie': Category.leisure,
      'Gym': Category.work,
      'Snacks': Category.food,
    };

    List<Expense> expenses = List.generate(count, (index) {
      final titleEntry =
          titles.entries.elementAt(random.nextInt(titles.length));
      String title = titleEntry.key;
      Category category = titleEntry.value;
      DateTime dateTime =
          DateTime.now().subtract(Duration(days: random.nextInt(365)));
      double amount = (random.nextDouble() * 100).roundToDouble();

      return Expense(
        title: title,
        category: category,
        dateTime: dateTime,
        amount: amount,
      );
    });

    return expenses;
  }

  static double calculateSum(List<Expense> expenses, Category category) {
    double sum = 0;
    List<Expense> catExpenses =
        expenses.where((expense) => expense.category == category).toList();
    for (Expense expense in catExpenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
