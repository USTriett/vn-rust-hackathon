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
        color: Color.fromARGB(40, 135, 135, 231),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // deposite 2 --- deposite & USD
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // deposite (name)
                    item.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 135, 135, 231),
                      // Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(50, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      // deposite / withdraw
                      '${item.type}',
                      style: TextStyle(
                        color: (item.type == "deposit"
                            ? Color.fromARGB(255, 74, 175, 74)
                            : Color.fromARGB(255, 175, 74, 74)),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              // token ~ USD
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.generating_tokens,
                          color: Color.fromARGB(255, 228, 118, 14),
                          size: 22.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${item.token.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      "~",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(150, 200, 200, 200),
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Color.fromARGB(255, 228, 118, 14),
                          size: 22.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${item.cash.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Balance: \$${item.balance.toString()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start Time:',
                    style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color.fromARGB(150, 200, 200, 200),
                        fontSize: 12),
                  ),
                  Text(
                    item.startTime.toIso8601String(),
                    style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color.fromARGB(150, 200, 200, 200),
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'End Time:',
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(150, 200, 200, 200),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item.endTime.toIso8601String(),
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(150, 200, 200, 200),
                      fontSize: 12,
                    ),
                  ),
                ],
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
