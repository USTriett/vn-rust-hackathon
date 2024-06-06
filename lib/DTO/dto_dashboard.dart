class DTODashboardItem {
  final String cointType;
  final String amountUSDT;
  final String amountUSD;
  final double derivativePercent;
  final String tag;

  DTODashboardItem({
    required this.cointType,
    required this.amountUSDT,
    required this.amountUSD,
    required this.derivativePercent,
    required this.tag,
  });

  factory DTODashboardItem.fromJson(Map<String, dynamic> json) {
    return DTODashboardItem(
      cointType: json['coinType'],
      amountUSDT: json['amountUSDT'],
      amountUSD: json['amountUSD'],
      derivativePercent: json['derivativePercent'],
      tag: json['tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coinType': cointType,
      'amountUSDT': amountUSDT,
      'amountUSD': amountUSD,
      'derivativePercent': derivativePercent,
      'tag': tag,
    };
  }
}
