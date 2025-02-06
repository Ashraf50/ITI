class SimpleTime {
  final int hours;
  final int minutes;
  final int seconds;
  final int nanoseconds;
  SimpleTime({
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.nanoseconds = 0,
  });

  int toSecondOfDay() {
    return (hours * 3600) + (minutes * 60) + seconds;
  }

  int toNanoOfDay() {
    return (toSecondOfDay() * 1000000000) + nanoseconds;
  }
}

void main() {
  SimpleTime time1 = SimpleTime(hours: 12);
  print(time1.toSecondOfDay());

  SimpleTime time2 = SimpleTime(hours: 6, minutes: 30);
  print(time2.toNanoOfDay());
  SimpleTime time3 = SimpleTime(nanoseconds: 1);
  print(time3.toNanoOfDay());
}
