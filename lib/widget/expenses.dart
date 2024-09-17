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
    final expenseIndex = _registeredExpensed.indexOf(expense);
    setState(() {
      _registeredExpensed.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: const Text('Expense Deleted !'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpensed.insert(expenseIndex, expense);
            });
          }),
    ));
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
    Widget mainContent = const Center(
      child: Text('No Expenses Found . Start adding some..'),
    );

    if (_registeredExpensed.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpensed,
        onRemoveExpense: _removeExpense,
      );
    }
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
              Expanded(child: mainContent),
            ]),
      ),
    );
  }
}
