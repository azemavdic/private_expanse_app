import './transaction_model.dart';
import 'package:flutter/material.dart';

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
      ),
      home: MyHomePage(title: 'Lični troškovi'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<TransactionModel> transactions = [
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
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
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
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigoAccent,
                      ),
                      width: 40.0,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(tx.title),
                        Text(tx.date.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
