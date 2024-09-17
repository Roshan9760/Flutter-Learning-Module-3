import 'package:expensetrackerapp/models/expense.dart';
import 'package:expensetrackerapp/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (contx, indx) => Dismissible(
          key: ValueKey(expenses[indx]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[indx]);
          },
          child: ExpensesItem(expenses[indx])),
    );
  }
}
