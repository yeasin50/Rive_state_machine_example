import 'package:flutter/material.dart';

import 'package:state_machine_rive/components/components.RectNeonFrame.dart';
import 'package:state_machine_rive/components/components.colorSets.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  final Size size;
  final double borderWidth;

  const CustomTextFiled({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obsecure,
    required this.size,
    this.borderWidth = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeonRectBG(
      size: size,
      frameThickness: borderWidth,
      colors: obsecure ? defaultColors : colorizeColors,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        width: size.width,
        height: size.height,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white60,
            ),
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
      ),
    );
  }
}
