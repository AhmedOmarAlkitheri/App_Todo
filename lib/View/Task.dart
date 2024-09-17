import 'package:flutter/material.dart';
import 'package:todo_app/Api/ApiData.dart';
import 'package:todo_app/Model/todo.dart';
import 'package:todo_app/View/AllTask.dart';
import 'package:todo_app/View/CompleteTask.dart';
import 'package:todo_app/View/NotCompleteTask.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  late Future<List<Todo>?> allTasks;
  Apidata api = Apidata();
  @override
  void initState() {
    super.initState();
    //  allTasks = await Apidata().fetchData() ;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Todo",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown[500],
          bottom: TabBar(tabs: [
            Text(
              "allTask",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              "CompleteTask",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              "NotCompleteTask",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ]),
        ),
        body: TabBarView(
            children: [Alltask(), Completetask(), Notcompletetask()]),
      ),
    );
  }
}
