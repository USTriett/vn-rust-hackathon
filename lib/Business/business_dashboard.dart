class BusinessDashboard {
  // DTODashboard  here

  static String GetCoinType(int index) {
    print(index);
    return "ETH";
  }

  static String GetAmountUSDT(int index) {
    print(index);
    return "6.546B USDT";
  }

  static String GetAmountUSD(int index) {
    print(index);
    return "70,776.90 USD";
  }

  static double GetDerivativePercent(int index) {
    print(index);
    return -11.36;
  }

  static String GetTag(int index) {
    print(index);
    return "new";
  }

  static int GetNumberRecord() {
    return 10;
  }

  static int GetNumberTab() {
    return 3;
  }

  static String GetHeader(int index) {
    switch (index) {
      case 0:
        return "All";
      case 1:
        return "Hot";
      default:
        return "New";
    }
  }
}
