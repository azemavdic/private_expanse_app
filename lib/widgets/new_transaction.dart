import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({this.newTransaction});
  final Function newTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Naziv',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Iznos',
              ),
            ),
            TextButton(
              onPressed: () {
                newTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Dodaj trošak'),
            ),
          ],
        ),
      ),
    );
  }
}
