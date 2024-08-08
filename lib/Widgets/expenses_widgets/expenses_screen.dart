import 'package:expense_tracker/Widgets/add_screen_widgets/add_screen.dart';
import 'package:expense_tracker/Widgets/chart_widgets/chart.dart';
import 'package:expense_tracker/Widgets/expenses_widgets/expense_card.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  late List<Expense> expenses;

  Widget emptyScreenWidget = Column(
    children: [
      Chart(const []),
      const Text(
        "Add Some Expenses",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        textAlign: TextAlign.center,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    expenses = Utils.generateDummyExpenses(20);
  }

  void onUndo(int index, Expense expense) {
    setState(() {
      expenses.insert(index, expense);
    });
  }

  void goToAddScreen() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddScreen(onSave, onCancel),
    );
  }

  void onSave(Expense expense) {
    setState(() {
      setState(() {
        expenses.add(expense);
      });
      Navigator.of(context).pop();
    });
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void onRemove(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: goToAddScreen,
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text(
          "Expenses Tracker",
          textAlign: TextAlign.left,
          style: TextStyle(),
        ),
      ),
      body: expenses.isEmpty
          ? emptyScreenWidget
          : width > 700
              ? Row(
                  children: [
                    Expanded(child: Chart(expenses)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          return ExpenseCard(
                              expenses[index], onRemove, index, onUndo);
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Chart(expenses),
                    Expanded(
                      child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          return ExpenseCard(
                              expenses[index], onRemove, index, onUndo);
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
