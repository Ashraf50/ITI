import 'dart:math';

void main() {
  String starting = 'A';
  List<String> randomStrings = generateRandomStrings(starting);
  print(randomStrings);
}

List<String> generateRandomStrings(String starting) {
  List<String> randomStrings = [];
  Random random = Random();
  for (int i = 0; i < 3; i++) {
    String randomString = starting;
    for (int j = 0; j < 5; j++) {
      String randomChar = String.fromCharCode(random.nextInt(26)+97);
      randomString += randomChar;
    }
    randomStrings.add(randomString);
  }
  return randomStrings;
}
