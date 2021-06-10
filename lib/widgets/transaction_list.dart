import 'package:expense_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList({this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nema troškova',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            transactions[index].amount.toStringAsFixed(2) +
                                ' KM',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy').format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
