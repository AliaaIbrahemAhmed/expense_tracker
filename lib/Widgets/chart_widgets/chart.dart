import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_bucket.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart(this.expenses, {super.key})
      : expenseBucket = ExpenseBucket.categorySum(expenses);
  final List<Expense> expenses;
  final ExpenseBucket expenseBucket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      height: 175,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
        gradient: LinearGradient(colors: [
          theme.scaffoldBackgroundColor,
          theme.colorScheme.secondaryContainer
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: expenseBucket.categoryExpensesMap.entries.map((mapEntry) {
          double f = (expenses.isNotEmpty)
              ? expenseBucket.categoryExpensesMap[mapEntry.key]! /
                  expenseBucket.maxValue
              : 0;
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    heightFactor: (f),
                    alignment: Alignment.bottomCenter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            topEnd: Radius.circular(10)),
                        color: isDarkMode
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.bottomCenter,
                  child: correspondingItem[mapEntry.key],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
