import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print('welcome');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Delete Task');
    print('4. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter the task: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Task added successfully');
        }
        break;

      case '2':
        if (tasks.isEmpty) {
          print('No tasks available');
        } else {
          print('Tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;

      case '3':
        if (tasks.isEmpty) {
          print('No tasks to delete.');
        } else {
          print('Enter the task number to delete:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
          stdout.write('Task number: ');
          String? input = stdin.readLineSync();
          int? index = int.tryParse(input ?? '');
          if (index != null && index > 0 && index <= tasks.length) {
            tasks.removeAt(index - 1);
            print('Task deleted successfully');
          } else {
            print('Invalid task number');
          }
        }
        break;
      case '4':
        print('Exiting');
        return;
      default:
        print('Invalid option');
    }
  }
}
