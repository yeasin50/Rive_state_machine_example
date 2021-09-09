import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Function onTap;

  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
