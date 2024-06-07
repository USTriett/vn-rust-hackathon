import 'dart:convert';

class Wallet {
  num amount;
  num price;
  Wallet(this.amount, this.price);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'amount': amount});
    result.addAll({'price': price});

    return result;
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      map['amount'] ?? 0,
      map['price'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));
}
