import 'package:flutter/material.dart';

import '../../DTO/dto_history.dart';

class HistoryItem extends StatelessWidget {
  final DTOHistoryItem item;

  HistoryItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color.fromARGB(50, 135, 135, 231),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Column(
                      children: [
                        Text('${item.type}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(
                          '\$${item.cash.toString()}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ': ${item.token.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Balance: \$${item.balance.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 20),
                  ),
                ],
              ),
              Text(
                'Start Time: ${item.startTime.toIso8601String()}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18),
              ),
              Text(
                'End Time: ${item.endTime.toIso8601String()}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18),
              ),
            ],
          ),
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
