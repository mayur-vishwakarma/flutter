import 'package:expense_tracker/widgets/expenses_List/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemove(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index]));
      },
    );
  }
}
