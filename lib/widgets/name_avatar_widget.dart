import 'package:flutter/material.dart';
import 'package:taskfull/config/theme.dart';

class NameAvatarWidget extends StatelessWidget {
  final String name;
  final String avatarUrl;
  const NameAvatarWidget(
      {super.key, required this.name, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: CustomFontStyle().normal(23, Colors.white),
            ),
            Text(
              name,
              style: CustomFontStyle().bold(24, Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
