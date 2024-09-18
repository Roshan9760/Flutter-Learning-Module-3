import 'package:flutter/material.dart';
import 'package:expensetrackerapp/models/expense.dart'; // Assuming you have this file



class NewExpense extends StatefulWidget {
   NewExpense({super.key,required this.onAddNewExpense});

  final void Function (Expense expense) onAddNewExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.food;

  // Date picker function
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

  // Submission function
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountInValid ||
        _selectedDate == null) {
      // show error message

      showDialog(
          context: context,
          builder: (cntx) => AlertDialog(
                title: const Text('Invalid Input details !'),
                content: const Text(
                    'Please Make Sure Correct or valid title,amount and date entered '),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cntx);
                      },
                      child: Text('Okay'))
                ],
              )
        );
      return;
    }

    // add new expense
    widget.onAddNewExpense(
      Expense(
        title: _titleController.text, 
        amount: enteredAmount, 
        date: _selectedDate!, 
        category: _selectedCategory!,
      ),
     
    );
    Navigator.pop(context);
  }

  // Dispose controllers after usage
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyboardSpace),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                      label: Text('Amount'), prefixText: '\$ '),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "No Date Selected"
                        : dateFomatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Add spacing between elements
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Dropdown on the left
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              // Buttons (Cancel and Save) on the right
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitExpenseData();
                    },
                    child: const Text('Save Expense'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
