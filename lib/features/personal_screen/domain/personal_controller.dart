import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalProvider =
    StateNotifierProvider<PersonalNotifier, homelState>((ref) {
  return PersonalNotifier();
});

class PersonalNotifier extends StateNotifier<homelState> {
  PersonalNotifier() : super(homelState.initial());
}
