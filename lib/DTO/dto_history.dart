import 'package:flutter/material.dart';

class DTOHistoryItem {
  final String name;
  final double cash;
  final double token;
  final String type; // deposit or Withdraw
  final DateTime startTime;
  final DateTime endTime;
  final double balance;

  DTOHistoryItem({
    required this.name,
    required this.cash,
    required this.token,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.balance,
  });

  factory DTOHistoryItem.fromJson(Map<String, dynamic> json) {
    return DTOHistoryItem(
      name: json['name'],
      cash: json['cash'],
      token: json['token'],
      type: json['type'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cash': cash,
      'token': token,
      'type': type,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'balance': balance,
    };
  }
}
