import 'dart:io';
import 'deposit.dart';
import 'withdraw.dart';
import 'balance_in_query.dart';
import 'account.dart';
import 'transaction.dart';

void main() {
  Account? userAccount;
  Transaction? lastTransaction;

  while (true) {
    print("\n📌 Select an option:");
    print("1 Enter account details");
    print("2 Deposit");
    print("3️ Withdraw");
    print("4️ Show current balance");
    print("5️ Cancel last transaction");
    print("6️ Exit");

    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        stdout.write("Enter account number: ");
        int accNumber = int.parse(stdin.readLineSync() ?? "0");
        stdout.write("Enter owner name: ");
        String owner = stdin.readLineSync() ?? "";
        stdout.write("Enter initial balance: ");
        double balance = double.parse(stdin.readLineSync() ?? "0.0");
        userAccount = Account(accNumber, owner, balance);
        print("Account created successfully!");
        break;
      case "2":
        if (userAccount == null) {
          print("No account found! Please create an account first.");
          break;
        }
        stdout.write("Enter deposit amount: ");
        double amount = double.parse(stdin.readLineSync() ?? "0.0");
        lastTransaction = Deposit(1, amount);
        lastTransaction.execute(userAccount);
        break;

      case "3":
        if (userAccount == null) {
          print("No account found! Please create an account first.");
          break;
        }

        stdout.write("Enter withdrawal amount: ");
        double amount = double.parse(stdin.readLineSync() ?? "0");
        lastTransaction = Withdraw(2, amount);
        lastTransaction.execute(userAccount);
        break;

      case "4":
        if (userAccount == null) {
          print("No account found! Please create an account first.");
          break;
        }

        stdout.write("Enter currency type (U for USD, E for Euro): ");
        String currency = stdin.readLineSync() ?? "U";
        BalanceInquiry(3, currency).execute(userAccount);
        break;

      case "5":
        if (userAccount == null || lastTransaction == null) {
          print("No transaction found to cancel!");
          break;
        }
        if (lastTransaction is Rollback) {
          (lastTransaction as Rollback).cancelTransaction(userAccount);
        } else {
          print("Last transaction cannot be canceled!");
        }
        break;

      case "6":
        print("Exiting the program...");
        return;
      default:
        print("Invalid choice! Please enter a number from 1 to 6.");
    }
  }
}
