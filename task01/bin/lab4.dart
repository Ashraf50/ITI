import 'dart:io';

void main() {
  print("Enter num of words");
  String? input = stdin.readLineSync();
  String longWord = longestWord(input!);
  String shortWord = shortestWord(input);
  print('The longest word is: $longWord');
  print('The shortest word is: $shortWord');
}

String longestWord(String sentence) {
  List<String> words = sentence.split(' ');
  String longest = words[0];
  for (String word in words) {
    if (word.length > longest.length) {
      longest = word;
    }
  }

  return longest;
}

String shortestWord(String sentence) {
  List<String> words = sentence.split(' ');
  String shortest = words[0];
  for (String word in words) {
    if (word.length < shortest.length) {
      shortest = word;
    }
  }

  return shortest;
}
