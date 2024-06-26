import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';

class MyButton extends StatelessWidget {
  final String lebel;
  final Function()? onTap;

  const MyButton({Key? key, required this.lebel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 40,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(82, 255, 255, 255),
          ),
          child: Text(
            lebel,
            style: CustomFontStyle().bold(28, kblue),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
