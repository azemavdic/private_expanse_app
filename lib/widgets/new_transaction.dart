import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({this.newTransaction});
  final Function newTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.newTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);
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
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Naziv',
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => submitData(),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Iznos',
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              TextButton(
                onPressed: submitData,
                child: Text('Dodaj trošak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
