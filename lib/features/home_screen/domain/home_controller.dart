import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<homeNotifier, homelState>((ref) {
  return homeNotifier();
});

class homeNotifier extends StateNotifier<homelState> {
  homeNotifier() : super(homelState.initial());
}
