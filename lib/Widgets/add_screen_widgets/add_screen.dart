import 'package:expense_tracker/Widgets/add_screen_widgets/category_dropdown.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen(this.onSave, this.onCancel, {super.key});
  final void Function(Expense expense) onSave;
  final void Function() onCancel;
  @override
  State<AddScreen> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  Category category = Category.food;
  late Expense expense;
  DateTime? _selectedDate;

  bool checkInputData() {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (cntx) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Please Enter Valid Input"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'))
              ],
            );
          });
      return false;
    }
    return true;
  }

  void pickDate() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void setCategory(Category category) {
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    double keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: amountController,
                      decoration: const InputDecoration(
                          labelText: "Amount", prefixText: "\$"),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Text(_selectedDate == null
                            ? "pick date"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: pickDate,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CategoryDropdown(setCategory),
                  const Spacer(),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (checkInputData()) {
                              expense = Expense(
                                  title: titleController.text,
                                  category: category,
                                  dateTime: DateTime.now(),
                                  amount: double.parse(amountController.text));
                              widget.onSave(expense);
                            }
                          },
                          child: const Text("Save")),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            widget.onCancel();
                          },
                          child: const Text("Cancel"))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
