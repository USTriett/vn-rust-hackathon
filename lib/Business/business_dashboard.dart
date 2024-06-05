class BusinessDashboard {
  // DTODashboard  here

  static String GetCoinType(int index, int tabIndex) {
    print(index);
    switch (index % 5) {
      case 0:
        return "ETH";
      case 1:
        return "BTC 563";
      case 2:
        return "cqphat";
      case 3:
        return "lthanhdat";
      default:
        return "hctriet";
    }
    // return "ETH";
  }

  static String GetAmountUSDT(int index, int tabIndex) {
    print(index);
    return "6.546B USDT";
  }

  static String GetAmountUSD(int index, int tabIndex) {
    print(index);
    return "70,776.90 USD";
  }

  static double GetDerivativePercent(int index, int tabIndex) {
    print(index);
    switch (index % 3) {
      case 0:
        return 1.32;
      default:
        return -11.36;
    }
    // return -11.36;
  }

  static String GetTag(int index, int tabIndex) {
    print(index);
    return "new";
  }

  static int GetNumberRecord(int tabIndex) {
    return 15;
  }

  static int GetNumberTab() {
    return 3;
  }

  static String GetHeader(int index) {
    switch (index % 3) {
      case 0:
        return "All";
      case 1:
        return "Hot";
      default:
        return "New";
    }
  }
}
