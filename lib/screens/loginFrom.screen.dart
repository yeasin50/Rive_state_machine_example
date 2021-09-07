import 'package:flutter/material.dart';

import 'Login/components/login.component.loginButton.dart';
import 'Login/components/login.component.textField.dart';
import 'Login/components/loginScreen.component.smileRive.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              // SmileRive(
              //   constraints: constraints,
              // ),

              // AuthForm(),
              CustomTextFiled(
                  // obsecure: false,
                  ),

              LoginButton(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
