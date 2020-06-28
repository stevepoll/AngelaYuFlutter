class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

class TaskList {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get tasksLeftCount {
    return tasks.where((task) => task.isDone == false).length;
  }
}
