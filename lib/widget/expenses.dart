import 'package:expensetrackerapp/widget/expenses_list/expenses_list.dart';
import 'package:expensetrackerapp/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expensetrackerapp/models/expense.dart';

class Exprenses extends StatefulWidget {
  const Exprenses({super.key});
  @override
  State<Exprenses> createState() {
    return _ExprensesSatate();
  }
}

class _ExprensesSatate extends State<Exprenses> {
  final List<Expense> _registeredExpensed = [
    Expense(
        title: 'flutter course',
        amount: 11.23,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Naan Thali',
        amount: 112.23,
        date: DateTime.now(),
        category: Category.food)
  ];

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpensed.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpensed.remove(expense);
    });
  }

  void _openAndAddExpenseOverley() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (cntx) {
          return NewExpense(
            onAddNewExpense: _addExpenses,
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker App"),
        actions: [
          IconButton(
            onPressed: _openAndAddExpenseOverley,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('The Chart of Expenses'),
              Expanded(child: ExpensesList(
                expenses: _registeredExpensed,
                onRemoveExpense: _removeExpense,
                ),
            ),
            ]),
      ),
    );
  }
}
