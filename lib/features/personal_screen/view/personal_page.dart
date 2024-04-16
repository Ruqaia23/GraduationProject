import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/personal_screen/domain/personal_controller.dart';
import 'package:taskfull/widgets/daily_steps_container.dart';
import 'package:taskfull/widgets/name_avatar_widget.dart';
import 'package:taskfull/widgets/progress_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalScreen extends ConsumerStatefulWidget {
  const PersonalScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends ConsumerState<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.read(personalProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,

      /* appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 53, 49, 100),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(203, 208, 95, 1),
                  size: 30,
                )),
          ),
        ],
      ),*/

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  // Header Section
                  NameAvatarWidget(
                    name: state.user.firstName.toString(),
                    avatarUrl: "",
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // Body Section
                  ProgressBarWidget(
                    totalProject: state.total.toString(),
                    doneProject: state.done.toString(),
                    inProgressProject: state.inProgress.toString(),
                    pendingProject: state.pending.toString(),
                  ),

                  SizedBox(
                    height: 100,
                  ),
                  // Footer Section
                  DailyStepsWidget(steps: state.steps.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
