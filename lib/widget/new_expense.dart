import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseSatate();
  }
}

class _NewExpenseSatate extends State<NewExpense> {
  var _enteredTitle = '';

  void _saveTitleInput(String inputText) {
    _enteredTitle = inputText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            onChanged: _saveTitleInput,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_enteredTitle);
                },
                child: const Text('Save The Title'),
              )
            ],
          )
        ],
      ),
    );
  }
}
