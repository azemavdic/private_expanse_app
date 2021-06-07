import 'package:expense_app/models/transaction_model.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<TransactionModel> _transactions = [
    TransactionModel(
      id: '1',
      title: 'Kupovina 1',
      amount: 25.5,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: '2',
      title: 'Kupovina 2',
      amount: 30,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: '3',
      title: 'Kupovina 3',
      amount: 12.7,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: '4',
      title: 'Kupovina 5',
      amount: 7.5,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = TransactionModel(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          newTransaction: _addNewTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        ),
      ],
    );
  }
}
