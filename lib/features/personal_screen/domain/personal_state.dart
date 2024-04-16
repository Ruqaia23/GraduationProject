import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskfull/models/user.dart';

class homelState {
  final UserName user;
  final int done;
  final int inProgress;
  final int pending;
  final int total;
  final int steps;
  homelState({
    required this.user,
    required this.done,
    required this.inProgress,
    required this.pending,
    required this.total,
    required this.steps,
  });

  factory homelState.initial() {
    return homelState(
      done: 1,
      inProgress: 4,
      pending: 3,
      total: 0,
      steps: 3000,
      user: UserName(
        id: 0,
        firstName: "Ruqaia Alqhuawaizi",
        lastName: "Alqhuawaizi",
        imgUrl: "",
      ),
    );
  }

  homelState copyWith({
    UserName? user,
    int? done,
    int? inProgress,
    int? pending,
    int? total,
    int? steps,
  }) {
    return homelState(
      user: user ?? this.user,
      done: done ?? this.done,
      inProgress: inProgress ?? this.inProgress,
      pending: pending ?? this.pending,
      total: total ?? this.total,
      steps: steps ?? this.steps,
    );
  }
}
