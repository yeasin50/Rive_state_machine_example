import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'package:state_machine_rive/views/Login/controllers/loginScreen.controller.emojiAnimation.dart';

class SmileRive extends StatefulWidget {
  const SmileRive({
    Key? key,
  }) : super(key: key);

  @override
  _SmileRiveState createState() => _SmileRiveState();
}

class _SmileRiveState extends State<SmileRive> {
  StateMachineController? animationState;

  SMIInput<double>? valueController;
  Artboard? _riveArtboard;

  //* animationState  inputs
  SMITrigger? blinkAnim;
  SMITrigger? focusOnTextAnim;
  SMITrigger? unFocusFromText;
  SMITrigger? hatDownAnim;
  SMITrigger? hatUpAnim;
  SMIBool? idleAnim;

  @override
  void initState() {
    super.initState();

    rootBundle.load("rives/smile_face.riv").then((value) async {
      RiveFile file = RiveFile.import(value);

      final artboard = file.mainArtboard;

      animationState =
          StateMachineController.fromArtboard(artboard, "anim_controller");

      if (animationState != null) {
        EmojiAnimationController(animationState);
      }

      setState(() {
        _riveArtboard = artboard;
      });
    });
  }

  @override
  void dispose() {
    animationState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? Text("Unalble to find rive")
        : Rive(
            artboard: _riveArtboard!,
          );

    // FocusScope(
    //   onFocusChange: (value) {
    //     setState(() {
    //       idleAnim!.value = !value;
    //     });
    //   },
    //   child: TextField(
    //     scrollPhysics: BouncingScrollPhysics(),
    //     controller: w,
    //     decoration: InputDecoration(hintText: "Email"),
    //   ),
    // ),
    // FocusScope(
    //   onFocusChange: (value) {
    //     print("focus2 $value");
    //     if (value)
    //       hatDownAnim!.fire();
    //     else
    //       hatUpAnim!.fire();
    //   },
    //   child: TextField(
    //     scrollPhysics: BouncingScrollPhysics(),
    //     obscureText: true,
    //     decoration: InputDecoration(hintText: "Password"),
    //   ),
    // ),
  }
}
