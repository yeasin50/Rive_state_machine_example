import 'package:flutter/material.dart';

import 'package:state_machine_rive/components/components.RectNeonFrame.dart';
import 'package:state_machine_rive/components/components.colorSets.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obsecure;
  final Size size;
  final double borderWidth;
  final Function? onChanged;

  const CustomTextFiled({
    Key? key,
    this.controller,
    required this.hintText,
    required this.obsecure,
    required this.size,
    this.borderWidth = 4.0,
    this.onChanged,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: size.width,
        height: size.height,
        child: TextField(
          // what could be shortWay
          onChanged: (v) => onChanged != null ? onChanged!(v) : null,
          controller: controller ?? null,
          style: TextStyle(
              // color: Colors.white,
              ),
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black54,
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
