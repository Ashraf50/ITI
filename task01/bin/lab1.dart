import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!);
  List<String> feelings = [];
  for (int i = 0; i < n; i++) {
    if (i % 2 == 0) {
      feelings.add("I hate");
    } else {
      feelings.add("I love");
    }
  }
  String result = "${feelings.join(" that ")} it";
  print(result);
}
