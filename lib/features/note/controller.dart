import 'package:flutter/cupertino.dart';
import 'package:taskfull/data/hive_functions.dart';
import 'package:taskfull/features/note/note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/models/note_model.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, NoteState>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<NoteState> {
  NotesNotifier() : super(NoteState.init()) {
    getNotes();
  }

  void getNotes() async {
    final res = await HiveFunc().getNotes();
    state = state.copyWith(notes: res);
  }

  void deleteNote(int index, BuildContext context) async {
    print('here');
    await HiveFunc().deleteNote(state.notes[index]);
    getNotes();
    Navigator.pop(context);
  }

  void addNote(BuildContext context) async {
    await HiveFunc().setNewNote(NoteModel(
        title: state.title.text,
        content: state.content.text,
        modifiefTime: DateTime.now()));
    state = state.copyWith(
        title: TextEditingController(), content: TextEditingController());
    getNotes();
    Navigator.pop(context);
  }
}
