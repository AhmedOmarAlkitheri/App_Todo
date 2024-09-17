import 'package:flutter/material.dart';
import 'package:todo_app/Api/ApiData.dart';

class Notcompletetask extends StatelessWidget {
  const Notcompletetask({super.key});

  @override
  Widget build(BuildContext context) {
    Apidata api = Apidata();
    // List<Todo> completetask = Apidata().taskcompelet;

    return Scaffold(
      body: FutureBuilder(
        future: api.fetchData("Notcomplete"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      tileColor: snapshot.data![index].isCompleted == true
                          ? Colors.green
                          : Colors.red,
                      title:
                          Text("the todo = ${snapshot.data![index].todoName}"),
                      trailing: snapshot.data![index].isCompleted == true
                          ? Icon(Icons.task_alt_rounded)
                          : Icon(Icons.error_outline),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
