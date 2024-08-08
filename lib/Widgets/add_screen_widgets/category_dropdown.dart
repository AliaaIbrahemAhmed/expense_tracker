import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown(this.setCategory, {super.key});
  final void Function(Category category) setCategory;
  @override
  State<CategoryDropdown> createState() {
    return _CategoryDropdownState();
  }
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category category = Category.food;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: category,
      items: Category.values
          .map((category) => DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    correspondingItem[category]!,
                    const SizedBox(
                      width: 8,
                    ),
                    Text(category.name),
                  ],
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          category = value!;
          widget.setCategory(category);
        });
      },
    );
  }
}
