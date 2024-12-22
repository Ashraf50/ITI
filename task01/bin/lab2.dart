import 'dart:io';

void main() {
  List<int> input = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int k = input[0]; 
  int n = input[1];  
  int w = input[2];

  int totalCost = k * (w * (w + 1)) ~/ 2;

  int borrowAmount = totalCost - n;

  if (borrowAmount <= 0) {
    print(0);
  } else {
    print(borrowAmount);
  }
}
