import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid =
        (enteredAmount == null) || enteredAmount <= 0 ? true : false;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                  "Please make sure a valid Title,Amount, Date and category was entered"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"))
              ],
            );
          });
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
              label: Text(
            "Title",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixText: "Rs. ",
                    label: Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(_selectedDate == null
                    ? "No Date Selected"
                    : formatter.format(_selectedDate!)),
                IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            const Spacer(),
            ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense")),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close")),
          ],
        )
      ]),
    );
  }
}
