class Task {
  Task({this.isDone = false, required this.taskName});

  String taskName;
  bool isDone;

  void toggle() {
    isDone = !isDone;
  }
}
