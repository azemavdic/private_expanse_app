import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lični troškovi',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.blueAccent,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(title: 'Lični troškovi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TransactionModel> _transactions = [
    // TransactionModel(
    //   id: '1',
    //   title: 'Kupovina 1',
    //   amount: 25.5,
    //   date: DateTime.now(),
    // ),
    // TransactionModel(
    //   id: '2',
    //   title: 'Kupovina 2',
    //   amount: 30,
    //   date: DateTime.now(),
    // ),
    // TransactionModel(
    //   id: '3',
    //   title: 'Kupovina 3',
    //   amount: 12.7,
    //   date: DateTime.now(),
    // ),
    // TransactionModel(
    //   id: '4',
    //   title: 'Kupovina 5',
    //   amount: 7.5,
    //   date: DateTime.now(),
    // ),
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

  void _showAddNewExpense(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return NewTransaction(
            newTransaction: _addNewTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Container(
        width: double.infinity,
        height: 150.0,
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: Center(
            child: Text(
              'CHART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          color: Colors.indigo.shade400,
        ),
      ),
      TransactionList(
        transactions: _transactions,
      ),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewExpense(context),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddNewExpense(context),
          ),
        ],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children2,
        ),
      ),
    );
  }
}
