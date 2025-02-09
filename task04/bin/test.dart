import 'dart:io';

void main() {
  print("Enter the value of n:");
  int n = int.parse(stdin.readLineSync()!);

  print("Enter the value of m:");
  int m = int.parse(stdin.readLineSync()!);

  print("Enter the value of a:");
  int a = int.parse(stdin.readLineSync()!);

  int tilesX = (n / a).ceil();
  int tilesY = (m / a).ceil();

  int result = tilesX * tilesY;

  print("number of tiles needed: $result");
}

