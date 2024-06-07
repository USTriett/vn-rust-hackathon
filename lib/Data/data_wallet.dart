import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../DTO/dto_wallet.dart';

class WalletModel extends ChangeNotifier {
  Wallet _wallet = Wallet(2, 100.2);

  Wallet get wallet => _wallet;

  Future<void> Update() async {
    Wallet w = await DataWallet.updateWalletData();
    if (w.amount != wallet.amount || w.price != wallet.price) {
      _wallet = w;
      notifyListeners();
    }
  }
}

class DataWallet {
  static Future<Wallet> updateWalletData() async {
    // Random random = Random();
    await Duration(seconds: 1);
    // Simulate random updates to amount and price
    num newAmount = 200;
    num newPrice = 100;

    // Update the walle
    return Wallet(newAmount, newPrice);
    // Notify listeners about the change
  }
}
