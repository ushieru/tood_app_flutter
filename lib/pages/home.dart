import 'package:flutter/material.dart';
import 'package:mi_primera_aplicacion/models/task.dart';
import 'package:mi_primera_aplicacion/pages/new_task.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task('nombre', 'description', false),
    Task('nombre2', 'description2', false),
    Task('nombre3', 'description3', true),
    Task('nombre4', 'description4', false),
  ];

  addNewTask(BuildContext context) async {
    dynamic task = await Navigator.pushNamed(context, NewTaskPage.route);
    if (task != null) {
      setState(() {
        tasks.add(task);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: tasks.length,
        itemBuilder: (context, position) {
          var task = tasks[position];
          return Row(
            children: [
              Checkbox(
                value: task.isComplete,
                onChanged: (isComplete) {
                  setState(() {
                    task.isComplete = isComplete ?? false;
                  });
                },
              ),
              Text(task.name)
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addNewTask(context),
      ),
    );
  }
}
