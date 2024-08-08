import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

var uuid = const Uuid();

final formatter = DateFormat.yMd();

final Map<Category, Icon> correspondingItem = {
  Category.food: const Icon(Icons.fastfood),
  Category.travel: const Icon(Icons.flight),
  Category.leisure: const Icon(Icons.movie),
  Category.work: const Icon(Icons.work),
};

class Expense {
  Expense({
    required this.title,
    required this.category,
    required this.dateTime,
    required this.amount,
  }) : id = uuid.v4();

  final String title;
  final Category category;
  final DateTime dateTime;
  final double amount;
  final String id;

  set title(String title) {
    this.title = title;
  }

  set category(Category category) {
    this.category = category;
  }

  set dateTime(DateTime dateTime) {
    this.dateTime = dateTime;
  }

  set amount(double amount) {
    this.amount = amount;
  }

  String get formattedDate => formatter.format(dateTime);
  Icon get icon => correspondingItem[category]!;
}
