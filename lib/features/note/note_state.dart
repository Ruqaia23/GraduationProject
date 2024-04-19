import 'package:taskfull/models/note_model.dart';

class NoteState {
  final List<NoteModel> notes;

  NoteState({required this.notes});

  factory NoteState.init() {
    return NoteState(notes: []);
  }

  NoteState copyWith({List<NoteModel>? notes}) {
    return NoteState(notes: notes ?? this.notes);
  }
}
