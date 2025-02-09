import 'account.dart';

abstract class Transaction {
  int transactionId;
  Transaction(this.transactionId);
  double execute(Account account);
}

abstract class Rollback {
  double cancelTransaction(Account account);
}
