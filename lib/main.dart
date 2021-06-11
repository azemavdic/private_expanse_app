import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction_model.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
      title: 'Kupovina 4',
      amount: 7.5,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = false;

  List<TransactionModel> get _recentTransactions {
    return _transactions
        .where(
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = TransactionModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

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

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showAddNewExpense(context),
        ),
      ],
      title: Text(widget.title),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewExpense(context),
        child: Icon(Icons.add),
      ),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Prikaži dijagram'),
                Switch(
                    value: _showChart,
                    onChanged: (bool newValue) {
                      setState(() {
                        _showChart = newValue;
                      });
                    }),
              ],
            ),
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: Chart(
                      recentTransactions: _recentTransactions,
                    ),
                  )
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.75,
                    child: TransactionList(
                      transactions: _transactions,
                      deleteTransaction: _deleteTransaction,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
