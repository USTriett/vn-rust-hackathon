import 'package:flutter/material.dart';

import '../../DTO/dto_history.dart';

class HistoryItem extends StatelessWidget {
  final DTOHistoryItem item;

  HistoryItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              '\$${item.cash.toString()}',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text('Token: ${item.token.toString()}'),
            Text('Type: ${item.type}'),
            Text('Start Time: ${item.startTime.toIso8601String()}'),
            Text('End Time: ${item.endTime.toIso8601String()}'),
            Text('Balance: \$${item.balance.toString()}'),
          ],
        ),
      ),
    );
  }

  static List<DTOHistoryItem> createSampleData() {
    return [
      DTOHistoryItem(
        name: 'Deposit 1',
        cash: 100.0,
        token: 50.0,
        type: 'deposit',
        startTime: DateTime.now().subtract(Duration(days: 1)),
        endTime: DateTime.now(),
        balance: 150.0,
      ),
      DTOHistoryItem(
        name: 'Deposit 1',
        cash: 100.0,
        token: 50.0,
        type: 'deposit',
        startTime: DateTime.now().subtract(Duration(days: 1)),
        endTime: DateTime.now(),
        balance: 150.0,
      ),
      DTOHistoryItem(
        name: 'Deposit 1',
        cash: 100.0,
        token: 50.0,
        type: 'deposit',
        startTime: DateTime.now().subtract(Duration(days: 1)),
        endTime: DateTime.now(),
        balance: 150.0,
      ),
      DTOHistoryItem(
        name: 'Withdrawal 1',
        cash: 200.0,
        token: 100.0,
        type: 'withdraw',
        startTime: DateTime.now().subtract(Duration(days: 2)),
        endTime: DateTime.now().subtract(Duration(days: 1)),
        balance: 300.0,
      ),
      DTOHistoryItem(
        name: 'Deposit 2',
        cash: 300.0,
        token: 150.0,
        type: 'deposit',
        startTime: DateTime.now().subtract(Duration(days: 3)),
        endTime: DateTime.now().subtract(Duration(days: 2)),
        balance: 450.0,
      ),
      DTOHistoryItem(
        name: 'Withdrawal 2',
        cash: 400.0,
        token: 200.0,
        type: 'withdraw',
        startTime: DateTime.now().subtract(Duration(days: 4)),
        endTime: DateTime.now().subtract(Duration(days: 3)),
        balance: 600.0,
      ),
    ];
  }
}
