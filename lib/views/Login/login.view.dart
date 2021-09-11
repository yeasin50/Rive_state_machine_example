import 'dart:math' as math;

import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            ///kinda frameSkip
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 1100,
                maxHeight: 1100,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double riveHeight =
                      math.min(constraints.maxWidth, constraints.maxHeight) *
                          .5;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmileRive(
                        height: riveHeight,
                      ),
                      FocusScope(
                        onFocusChange: (value) {
                          // EmojiAnimationController.instance.isIdleAnimRunning;
                          EmojiAnimationController.instance
                              .idleAnimation(!value);
                        },
                        child: CustomTextFiled(
                          obsecure: false,
                          hintText: "Email",
                          borderWidth: 4,
                          size: Size(constraints.maxWidth * .5, kToolbarHeight),
                          onChanged: (v) {
                            /// `controllerEmail.text.length * 1.0` => `1.0` depend on textFieldWidth
                            print(constraints.maxWidth);
                            EmojiAnimationController.instance.followText(
                                v.length * (1100 / constraints.maxWidth));
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      FocusScope(
                        onFocusChange: (value) {
                          EmojiAnimationController.instance.hatDown(value);
                        },
                        child: CustomTextFiled(
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
        ),
      ),
    );
  }
}
