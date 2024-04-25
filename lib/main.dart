import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskfull/app/task_app.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/data/hive_functions.dart';
import 'package:taskfull/models/note_model.dart';
import 'package:taskfull/screens/map.dart';
import 'package:taskfull/features/note/view/my_note.dart';
import 'package:taskfull/features/addProject_addTask_screen/view/add_project.dart';
import 'package:taskfull/features/addTask_screen/view/add_task.dart';
import 'package:taskfull/features/home_screen/view/home_screen.dart';
import 'package:taskfull/features/personal_screen/view/personal_page.dart';
import 'package:taskfull/splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  /* WidgetsFlutterBinding.ensureInitialized();
  //await DBHelper.initDb();
  //await GetStorage.init();
  await Supabase.initialize(
    url: 'https://aljaaismfxsojwghxcui.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsamFhaXNtZnhzb2p3Z2h4Y3VpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0MzkyNzEsImV4cCI6MjAyODAxNTI3MX0.MvDo--5brjjhdAve5nBmcqTs3ZJyhYMUXvTQBF6bz3U',
  );*/
  // await HiveFunc().setNewNote(NoteModel(content: 'hello', title: 'the first'));
  // await HiveFunc().setNewNote(NoteModel(content: 'hello', title: 'the second'));
  // await HiveFunc().setNewNote(NoteModel(content: 'hello', title: 'the third'));
  final res = await HiveFunc().getNotes();

  runApp(ProviderScope(child: TaskApp()));
}

class TaskApp extends StatelessWidget {
  // final supabase = Supabase.instance.client;
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
