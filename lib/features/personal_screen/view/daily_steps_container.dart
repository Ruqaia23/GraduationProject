import 'package:flutter/material.dart';
import 'package:taskfull/config/theme.dart';

class DailyStepsWidget extends StatelessWidget {
  final String steps;
  const DailyStepsWidget({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your daily steps",
            style: CustomFontStyle().bold(22, Colors.white),
          ),
          Text(
            steps,
            style: CustomFontStyle().bold(26, Colors.white),
          ),
          Row(
            children: [
              Text(
                "Steps",
                style: CustomFontStyle().normal(16, Colors.white),
              ),
              Icon(
                Icons.directions_walk,
                size: 30,
                color: Color.fromRGBO(203, 208, 95, 1),
              )
            ],
          )
        ],
      ),
    );
  }
}
