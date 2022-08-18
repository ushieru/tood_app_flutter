import 'package:flutter/material.dart';
import 'package:mi_primera_aplicacion/pages/new_task.dart';
import './pages/home.dart';

void main() {
  runApp(const TODOApp());
}

class TODOApp extends StatelessWidget {
  const TODOApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.route: (context) => const HomePage(),
        NewTaskPage.route: (context) => NewTaskPage(),
      },
      initialRoute: HomePage.route,
    );
  }
}
