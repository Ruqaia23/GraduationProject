import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskfull/models/note_model.dart';
import 'package:taskfull/models/project.dart';
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

// note to hive
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

// task to hive
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

// project to hive
  Future<void> setNewProject(ProjectsModel projects) async {
    final box = await Hive.openBox('projects');
    final list = await box.get('projects', defaultValue: []);
    print(list);
    list.add(projects.toJson());
    await box.put('projects', list);
  }

  Future<List<ProjectsModel>> getProjects() async {
    final box = await Hive.openBox('projects');
    final list = await box.get('projects', defaultValue: []);
    List<ProjectsModel> project = [];
    list.forEach((element) {
      project.add(ProjectsModel.fromJson(element));
    });
    return project;
  }

  Future<void> deleteProject(ProjectsModel not) async {
    final box = await Hive.openBox('projects');
    List list = await box.get('projects', defaultValue: []);
    print(list);
    list.removeWhere(
      (ele) => ele['title'] == not.title && ele['note'] == not.note,
    );
    print(list);
  }
}
