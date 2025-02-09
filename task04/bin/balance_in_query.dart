import 'transaction.dart';
import 'account.dart';

class BalanceInquiry extends Transaction {
  String currencyType;

  BalanceInquiry(super.transactionId, this.currencyType);

  @override
  double execute(Account account) {
    double convertedBalance = account.balance;
    if (currencyType == "U") {
      convertedBalance /= 50;
    } else if (currencyType == 'E') {
      convertedBalance /= 70;
    }
    print("Current balance in $currencyType: $convertedBalance");
    return account.balance;
  }
}
