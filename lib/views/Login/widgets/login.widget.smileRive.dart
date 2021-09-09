import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:state_machine_rive/views/Login/controllers/loginScreen.controller.emojiAnimation.dart';

class SmileRive extends StatefulWidget {
  const SmileRive({
    Key? key,
  }) : super(key: key);

  @override
  SmileRiveState createState() => SmileRiveState();
}

class SmileRiveState extends State<SmileRive> {
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
        setState(() {
          /// * Make sure on provider
          artboard.addController(animationState!);
          EmojiAnimationController.instance.initInputs(animationState!);
        });
      }

      setState(() {
        _riveArtboard = artboard;
      });
    });
  }

  initInputs(controller) {
    valueController = controller.findInput('value');

    blinkAnim = controller.findInput<bool>("blink") as SMITrigger;

    focusOnTextAnim = controller.findInput<bool>("focusOnText") as SMITrigger;

    unFocusFromText = controller.findInput<bool>("unFocusText") as SMITrigger;

    hatDownAnim = controller.findInput<bool>("hatDown") as SMITrigger;
    hatUpAnim = controller.findInput<bool>("hatUp") as SMITrigger;

    idleAnim = controller.findInput<bool>('idle') as SMIBool;
    idleAnim!.value = true;
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
  }
}
