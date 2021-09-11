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
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerPassword;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController()
      ..addListener(() {
        /// `controllerEmail.text.length * 1.0` => `1.0` depend on textFieldWidth
        EmojiAnimationController.instance
            .followText(controllerEmail.text.length * 1.0);
      });
    controllerPassword = TextEditingController();
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
              ),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      key: UniqueKey(),
                      height: constraints.maxWidth * .4,
                      child: SmileRive(),
                    ),
                    FocusScope(
                      onFocusChange: (value) {
                        // EmojiAnimationController.instance.isIdleAnimRunning;
                        EmojiAnimationController.instance.idleAnimation(!value);
                      },
                      child: CustomTextFiled(
                        controller: controllerEmail,
                        obsecure: false,
                        hintText: "Email",
                        borderWidth: 4,
                        size: Size(constraints.maxWidth * .5, kToolbarHeight),
                      ),
                    ),
                    SizedBox(height: 16),
                    FocusScope(
                      onFocusChange: (value) {
                        EmojiAnimationController.instance.hatDown(value);
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
