import 'dart:io';

void main() {
  print("Please enter a number:");
  String inputStr = stdin.readLineSync() ?? '';
  int input = int.tryParse(inputStr) ?? 0;

  int result = reverseDigits(input);
  print('The reversed number is: $result');
}

int reverseDigits(int n) {
  String numStr = n.toString();
  String reversedStr = numStr.split('').reversed.join('');
  int reversedNumber = int.parse(reversedStr);
  return n < 0 ? -reversedNumber : reversedNumber;
}
