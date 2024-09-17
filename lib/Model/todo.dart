class Todo {
  late String todoName;
  late bool isCompleted;

  Todo({required this.todoName, required this.isCompleted});

  Todo.fromMap(Map<String, dynamic> todoMap) {
    todoName = todoMap["todo"];
    isCompleted = todoMap["completed"];
  }
}
