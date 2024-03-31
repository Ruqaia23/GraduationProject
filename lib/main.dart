import 'package:flutter/material.dart';
import 'package:taskfull/app/task_app.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/models/note.dart';
import 'package:taskfull/screens/my_note.dart';
import 'package:taskfull/screens/add_project.dart';
import 'package:taskfull/screens/add_task.dart';
import 'package:taskfull/screens/home_screen.dart';
import 'package:taskfull/screens/personal_page.dart';
import 'package:taskfull/splash.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFull',
      /*theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.dark,*/
      theme: ThemeData(
          primaryColor: kBackgroundColor, brightness: Brightness.light),
      darkTheme: ThemeData(),
      home: AddProjects(),
    );
  }
}
