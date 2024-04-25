import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomFontStyle().normal(16, bwhite),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    controller: controller,
                    style: customText().normal(14, Colors.black),
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: customText().normal(14, bwhite)
                        /*focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
            color: context.theme.backgroundColor,
            width: 0
           ),),*/

                        ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyprojectInputField extends StatelessWidget {
  final String title;
  final String projecthint;
  final TextEditingController? projectcontroller;
  final Widget? projectwidget;

  const MyprojectInputField({
    super.key,
    required this.title,
    required this.projecthint,
    required this.projectcontroller,
    required this.projectwidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomFontStyle().normal(16, bwhite),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: projectwidget == null ? false : true,
                    autofocus: false,
                    controller: projectcontroller,
                    style: customText().normal(14, Colors.black),
                    decoration: InputDecoration(
                        hintText: projecthint,
                        hintStyle: customText().normal(14, bwhite)),
                  ),
                ),
                projectwidget == null
                    ? Container()
                    : Container(
                        child: projectwidget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
