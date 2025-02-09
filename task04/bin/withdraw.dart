import 'transaction.dart';
import 'account.dart';

class Withdraw extends Transaction implements Rollback {
  double amount;

  Withdraw(super.transactionId, this.amount);

  @override
  double execute(Account account) {
    if (account.balance >= amount) {
      account.balance -= amount;
      print("Withdrawal successful: $amount. New balance: ${account.balance}");
      return account.balance;
    } else {
      print("Insufficient balance!");
      return account.balance;
    }
  }

  @override
  double cancelTransaction(Account account) {
    account.balance += amount;
    print(
        "Withdrawal canceled. Balance after cancellation: ${account.balance}");
    return account.balance;
  }
}
