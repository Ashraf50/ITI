void main() {
  Map<String, String> contacts = {
    'Omar': '01012345678',
    'Ashraf': '01012345678',
    'Ali': '01012345678',
    'ibra': '01012345678',
    'cr7': '01012345678',
  };
  List<String> friends = [
    'Ahmed',
    'ashraf',
    'ebrahim',
    'Alaa',
    'Khaled',
    'basma',
    'Ali',
  ];

  var keysWithLength4 = contacts.keys.where((key) => key.length == 4);
  var namesStartingWithA =
      friends.where((name) => name.toLowerCase().startsWith('a'));

  print('all keys that have length 4: $keysWithLength4');
  print('name that starts with alphabet a: $namesStartingWithA');
}
