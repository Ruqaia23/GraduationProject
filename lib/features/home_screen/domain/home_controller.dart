import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskfull/data/hive_functions.dart';
import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/models/task_model.dart';

final homeProvider = StateNotifierProvider<homeNotifier, homelState>((ref) {
  return homeNotifier();
});

class homeNotifier extends StateNotifier<homelState> {
  homeNotifier() : super(homelState.initial());
}
