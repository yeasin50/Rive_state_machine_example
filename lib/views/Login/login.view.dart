import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/loginScreen.controller.emojiAnimation.dart';
import 'widgets/login.widget.loginButton.dart';
import 'widgets/login.widget.smileRive.dart';
import 'widgets/login.widget.textField.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerPassword;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) => Consumer(
            builder: (context, watch, child) {
              final animNotifier = watch(animControllNotifier);
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxWidth * .3,
                    child: SmileRive(),
                  ),
                  // CustomTextFiled(
                  //   controller: controllerEmail,
                  //   obsecure: false,
                  //   hintText: "Email",
                  //   borderWidth: 4,
                  //   size: Size(constraints.maxWidth * .5, kToolbarHeight),
                  // ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        context.read(animControllNotifier).blinkEye(12);
                      },
                      child: Text("hatDoen")),
                  FocusScope(
                    onFocusChange: (value) {
                      animNotifier.hatDown(true);
                    },
                    child: CustomTextFiled(
                      controller: controllerPassword,
                      obsecure: true,
                      hintText: "Password",
                      borderWidth: 4,
                      size: Size(constraints.maxWidth * .5, kToolbarHeight),
                    ),
                  ),
                  LoginButton(
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
