import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils.dart';
import 'dart:math';

class ExpenseBucket {
  ExpenseBucket.categorySum(this.expenses) {
    categoryExpensesMap = {
      Category.food: Utils.calculateSum(expenses, Category.food),
      Category.leisure: Utils.calculateSum(expenses, Category.leisure),
      Category.travel: Utils.calculateSum(expenses, Category.travel),
      Category.work: Utils.calculateSum(expenses, Category.work),
    };
    maxValue = getMaxSum();
  }

  final List<Expense> expenses;
  late final Map<Category, double> categoryExpensesMap;
  late final double maxValue;

  double getMaxSum() {
    return categoryExpensesMap.values.reduce(max);
  }
}
