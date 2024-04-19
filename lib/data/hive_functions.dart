import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskfull/models/note_model.dart';

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
}
