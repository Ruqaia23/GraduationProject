import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskfull/models/note_model.dart';
import 'package:taskfull/models/task.dart';
import 'package:taskfull/models/task_model.dart';

class HiveFunc {
  Future<void> setNewNote(NoteModel noteModel) async {
    final box = await Hive.openBox('noteBox');

    final list = await box.get('notes', defaultValue: []);
    print(list);
    list.add(noteModel.toJson());
    await box.put('notes', list);
  }

  Future<List<NoteModel>> getNotes() async {
    final box = await Hive.openBox('noteBox');
    final list = await box.get('notes', defaultValue: []);
    List<NoteModel> notes = [];
    list.forEach((element) {
      notes.add(NoteModel.fromJson(element));
    });
    print(notes);
    return notes;
  }

  Future<void> deleteNote(NoteModel not) async {
    final box = await Hive.openBox('noteBox');
    List list = await box.get('notes', defaultValue: []);
    print(list);
    list.removeWhere(
      (ele) => ele['title'] == not.title && ele['content'] == not.content,
    );
    print(list);
  }

  Future<void> setNewTask(TaskModel taskModel) async {
    final box = await Hive.openBox('tasks');
    final list = await box.get('tasks', defaultValue: []);
    print(list);
    list.add(taskModel.toJson());
    await box.put('tasks', list);
  }

  Future<List<TaskModel>> getTasks() async {
    final box = await Hive.openBox('tasks');
    final list = await box.get('tasks', defaultValue: []);
    List<TaskModel> tasks = [];
    list.forEach((element) {
      tasks.add(TaskModel.fromJson(element));
    });
    return tasks;
  }

  Future<void> deleteTask(TaskModel not) async {
    final box = await Hive.openBox('tasks');
    List list = await box.get('tasks', defaultValue: []);
    print(list);
    list.removeWhere(
      (ele) => ele['title'] == not.title && ele['note'] == not.note,
    );
    print(list);
  }
}
