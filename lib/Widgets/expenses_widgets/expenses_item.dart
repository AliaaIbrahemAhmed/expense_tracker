import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(expense.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(
                '\$${expense.amount.toString()}',
              ),
              const Spacer(),
              Row(
                children: [
                  expense.icon,
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 90,
                    child: Text(
                      expense.formattedDate,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
