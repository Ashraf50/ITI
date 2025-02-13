void main() {
  Map<String, int> runners = {
    'Ahmed': 341,
    'Mohamed': 273,
    'Ismail': 278,
    'Hend': 329,
    'Aly': 445,
    'Hossam': 402,
    'Ola': 388,
    'Alaa': 275,
    'Basma': 243,
    'Mina': 334,
    'Nada': 412,
    'Saad': 393,
  };

  var runnersList = runners.entries.toList();
  runnersList.sort((a, b) => a.value.compareTo(b.value));

  var fastest = runnersList[0];
  print('Fastest runner: ${fastest.key}, ${fastest.value} minutes');

  var secondFastest = runnersList[1];
  print(
      'Second fastest runner: ${secondFastest.key}, ${secondFastest.value} minutes');
}
