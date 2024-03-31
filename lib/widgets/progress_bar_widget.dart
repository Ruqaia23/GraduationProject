import 'package:flutter/material.dart';
import 'package:taskfull/config/theme.dart';

class ProgressBarWidget extends StatelessWidget {
  final String totalProject;
  final String doneProject;
  final String inProgressProject;
  final String pendingProject;

  const ProgressBarWidget({
    super.key,
    required this.totalProject,
    required this.doneProject,
    required this.inProgressProject,
    required this.pendingProject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 160,
              width: 160,
              child: CircularProgressIndicator(
                color: Colors.white,
                value: 1,
                strokeWidth: 12,
              ),
            ),
            Text(
              "$totalProject\n Total ",
              textAlign: TextAlign.center,
              style: CustomFontStyle().bold(20, Colors.white),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Color.fromRGBO(203, 208, 95, 1),
                  ),
                ),
                Text(
                  "$doneProject\nDone",
                  textAlign: TextAlign.left,
                  style: CustomFontStyle()
                      .bold(14, Color.fromRGBO(153, 188, 133, 1)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(
                      Icons.hourglass_empty,
                      size: 30,
                      color: Color.fromRGBO(203, 208, 95, 1),
                    ),
                  ),
                  Text(
                    "$inProgressProject\nIn Progress",
                    textAlign: TextAlign.left,
                    style: CustomFontStyle()
                        .bold(14, Color.fromRGBO(153, 188, 133, 1)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.stop_rounded,
                    size: 30,
                    color: Color.fromRGBO(203, 208, 95, 1),
                  ),
                ),
                Text(
                  "$pendingProject\nPending",
                  textAlign: TextAlign.left,
                  style: CustomFontStyle()
                      .bold(14, Color.fromRGBO(153, 188, 133, 1)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
