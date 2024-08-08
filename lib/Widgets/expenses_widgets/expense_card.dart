import 'package:expense_tracker/Widgets/expenses_widgets/expenses_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.expense, this.onRemove, this.index, this.onUndo,
      {super.key});
  final Expense expense;
  final void Function(int index) onRemove;
  final int index;
  final Function(int index, Expense expense) onUndo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: Dismissible(
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.delete,
          ),
        ),
        key: Key(expense.id),
        onDismissed: (direction) {
          onRemove(index);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(seconds: 2),
                content: const Text('You deleted an expense'),
                action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {
                      onUndo(index, expense);
                    })),
          );
        },
        child: Card(
          child: ExpensesItem(expense),
        ),
      ),
    );
  }
}
