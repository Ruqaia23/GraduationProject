import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://aljaaismfxsojwghxcui.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsamFhaXNtZnhzb2p3Z2h4Y3VpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0MzkyNzEsImV4cCI6MjAyODAxNTI3MX0.MvDo--5brjjhdAve5nBmcqTs3ZJyhYMUXvTQBF6bz3U',
  );

  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFull',
      theme: ThemeData(
          primaryColor: kBackgroundColor, brightness: Brightness.light),
      darkTheme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
