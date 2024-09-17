import 'package:dio/dio.dart';
import 'package:todo_app/Model/todo.dart';

class Apidata {
  // Future<List<Todo>>
  Dio d = Dio();
  List<Todo> taskcompelet = [];
  List<Todo> taskNotcompelet = [];
  Future<List<Todo>> fetchData(String value) async {
    Response response = await d.get('https://dummyjson.com/todos');

    // List<Todo> alltodo = (response.data['todos'] as List)
    //     .map<Todo>(
    //       (e) => Todo.fromMap(e),
    //     )
    //     .toList();

    Map<String, dynamic> h = response.data as Map<String, dynamic>;
    List<Todo> dataTodoCheck = [];
    // print(response);
    List<Todo> dataTodo = h['todos'].map<Todo>((e) => Todo.fromMap(e)).toList();
    for (var i = 0; i < dataTodo.length; i++) {
      if (dataTodo[i].isCompleted == true) {
        taskcompelet.add(dataTodo[i]);
      } else {
        taskNotcompelet.add(dataTodo[i]);
      }
    }
    switch (value) {
      case "ALL":
        dataTodoCheck = dataTodo;
        break;
      case "Complete":
        dataTodoCheck = taskcompelet;
        break;
      case "Notcomplete":
        dataTodoCheck = taskNotcompelet;
        break;
    }
    return dataTodoCheck;
  }

  // check() async {
  //   List<Todo> dataTodo = await fetchData();
  //   for (var i = 0; i < dataTodo.length; i++) {
  //     if (dataTodo[i].isCompleted == true) {
  //       taskcompelet.add(dataTodo[i]);
  //     } else {
  //       taskNotcompelet.add(dataTodo[i]);
  //     }
  //   }
  //   print(taskcompelet.length);
  // }
}
