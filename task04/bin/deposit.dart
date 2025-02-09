import 'transaction.dart';
import 'account.dart';
class Deposit extends Transaction implements Rollback {
  double amount;

  Deposit(super.transactionId, this.amount);

  @override
  double execute(Account account) {
    account.balance += amount;
    print("Deposit successful: $amount. New balance: ${account.balance}");
    return account.balance;
  }

  @override
  double cancelTransaction(Account account) {
    account.balance -= amount;
    print("Deposit canceled. Balance after cancellation: ${account.balance}");
    return account.balance;
  }
}
