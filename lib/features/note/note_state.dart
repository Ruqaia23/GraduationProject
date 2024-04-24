import 'package:flutter/material.dart';
import 'package:taskfull/models/note_model.dart';

class NoteState {
  final List<NoteModel> notes;
  final TextEditingController content;
  final TextEditingController title;

  NoteState({
    required this.notes,
    required this.content,
    required this.title,
  });

  factory NoteState.init() {
    return NoteState(
        notes: [],
        content: TextEditingController(),
        title: TextEditingController());
  }

  NoteState copyWith({
    List<NoteModel>? notes,
    TextEditingController? content,
    TextEditingController? title,
  }) {
    return NoteState(
      notes: notes ?? this.notes,
      content: content ?? this.content,
      title: title ?? this.title,
    );
  }
}
