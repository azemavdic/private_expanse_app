import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({this.newTransaction});
  final Function newTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectedDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }
    widget.newTransaction(
      enteredTitle,
      enteredAmount,
      enteredDate,
    );

    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                textInputAction: TextInputAction.next,
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Naziv',
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submitData(),
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Iznos',
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Datum nije odabran'
                        : DateFormat('dd/MM/yyyy')
                            .format(_selectedDate)
                            .toString(),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Odaberi datum',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Dodaj trošak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
