import 'package:flutter/material.dart';
import 'package:mi_primera_aplicacion/models/task.dart';

class NewTaskPage extends StatelessWidget {
  static const String route = '/newTask';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  NewTaskPage({Key? key}) : super(key: key);

  nuevaTarea(BuildContext context) {
    var task = Task(
      nameController.text,
      descriptionController.text,
      false,
    );

    Navigator.pop<Task>(context, task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Nombre',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Descripcion',
            ),
          ),
          ElevatedButton(
            onPressed: () => nuevaTarea(context),
            child: const Text('Nueva tarea'),
          )
        ],
      ),
    ));
  }
}
