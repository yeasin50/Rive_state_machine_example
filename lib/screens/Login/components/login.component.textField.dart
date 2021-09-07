import 'package:flutter/material.dart';
import 'package:state_machine_rive/components/components.RectNeonFrame.dart';
import 'package:state_machine_rive/components/components.colorSets.dart';

class CustomTextFiled extends StatefulWidget {
  // final TextEditingController controller;
  // final String hintText;
  // final bool obsecure;

  const CustomTextFiled({
    Key? key,
    // required this.controller,
    // required this.hintText,
    // required this.obsecure,
  }) : super(key: key);

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        NeonRectBG(
          frameThickness: 4,
          colors: colorizeColors,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 300 - 4,
            height: kToolbarHeight - 4,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
                filled: true,
              ),
            ),
          ),
          size: Size(300, kToolbarHeight),
        ),
        SizedBox(
          height: 20,
        ),
        NeonRectBG(
          frameThickness: 4,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 300 - 4,
            height: kToolbarHeight - 4,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
                filled: true,
              ),
            ),
          ),
          size: Size(300, kToolbarHeight),
        ),
      ],
    );
  }
}
