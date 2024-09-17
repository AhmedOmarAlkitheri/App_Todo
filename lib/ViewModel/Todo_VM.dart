import 'package:todo_app/Api/ApiData.dart';

class TodoVm {
  Apidata api = Apidata();

  // Future<List<Todo>> loadTask() async {
  //   List<Map<String, dynamic>> tasks = await api.fetchData();
  //   return tasks.map<Todo>(
  //     (e) {
  //       return Todo.fromMap(e);
  //     },
  //   ).toList();
  //   // return tasks;
  // }
}
