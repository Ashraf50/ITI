import 'dart:io';

void main() {
  // int n = 10;
  // for (int i = 1; i <= n; i++) {
  //   for (int j = i; j < n; j++) {
  //     stdout.write(' ');
  //   }
  //   for (int j = 1; j <= i; j++) {
  //     stdout.write('*');
  //     stdout.write(' ');
  //   }
  //   print('');
  // }

  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    print('');
  }
  for (int i = 4; i >= 1; i--) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    print('');
  }
}
