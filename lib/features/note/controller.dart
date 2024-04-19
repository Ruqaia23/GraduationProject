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

  void addNote() async {
    await HiveFunc().setNewNote(NoteModel(title: 'state.title.text'));
  }
}
