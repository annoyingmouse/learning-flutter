import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions) {
    print('Constructor Chart');
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      // for (var i = 0; i < recentTransactions.length; i++) {
      //   if (recentTransactions[i].date.day == weekday.day &&
      //       recentTransactions[i].date.month == weekday.month &&
      //       recentTransactions[i].date.year == weekday.year) {
      //     totalSum += recentTransactions[i].amount;
      //   }
      // }

      for (var tx in recentTransactions) {
        if (tx.date.day == weekday.day &&
            tx.date.month == weekday.month &&
            tx.date.year == weekday.year) {
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, tx) {
      return sum + (tx['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build within Chart');
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                (data['day'] as String),
                (data['amount'] as double),
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
