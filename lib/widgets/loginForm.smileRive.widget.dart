import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SmileRive extends StatefulWidget {
  final BoxConstraints constraints;
  const SmileRive({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  _SmileRiveState createState() => _SmileRiveState();
}

class _SmileRiveState extends State<SmileRive> {
  StateMachineController? animationState;

  SMIInput<double>? valueController;
  Artboard? _riveArtboard;

  double sliderVal = 0.0;

  /// change value based on size>Width
  final double strengthOverTextFiled = 1.5;

  final TextEditingController textEditingController = TextEditingController();

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
        print("Got animState");
        artboard.addController(animationState!);

        valueController = animationState!.findInput('value');

        blinkAnim = animationState!.findInput<bool>("blink") as SMITrigger;

        focusOnTextAnim =
            animationState!.findInput<bool>("focusOnText") as SMITrigger;

        unFocusFromText =
            animationState!.findInput<bool>("unFocusText") as SMITrigger;

        hatDownAnim = animationState!.findInput<bool>("hatDown") as SMITrigger;
        hatUpAnim = animationState!.findInput<bool>("hatUp") as SMITrigger;

        idleAnim = animationState!.findInput<bool>('idle') as SMIBool;
        idleAnim!.value = true;
      }

      setState(() {
        _riveArtboard = artboard;
      });
    });

    ///* eye controll with textFiled
    textEditingController.addListener(
      () {
        print(textEditingController.text);

        if (valueController != null) {
          valueController!.value =
              textEditingController.text.length * strengthOverTextFiled;
        }
      },
    );
  }

  @override
  void dispose() {
    textEditingController.removeListener(() {});
    textEditingController.dispose();
    animationState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _riveArtboard == null
            ? Text("Unalble to find rive")
            : SizedBox(
                height: widget.constraints.maxHeight * .3,
                child: Rive(
                  artboard: _riveArtboard!,
                ),
              ),
        SizedBox(
          child: TextField(
            scrollPhysics: BouncingScrollPhysics(),
            controller: textEditingController,
            decoration: InputDecoration(hintText: "keep typing"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              idleAnim!.value = !idleAnim!.value;
            });
            print("idle value ${idleAnim!.value}");
          },
          child: Text("Idle"),
        ),
        ElevatedButton(
          onPressed: () {
            blinkAnim!.fire();
          },
          child: Text("Blink"),
        ),
        ElevatedButton(
          onPressed: () {
            focusOnTextAnim!.fire();
          },
          child: Text("FocusOnText"),
        ),
        ElevatedButton(
          onPressed: () {
            unFocusFromText!.fire();
          },
          child: Text("RM Focus Text"),
        ),
        ElevatedButton(
          onPressed: () {
            hatDownAnim!.fire();
          },
          child: Text("HatDown"),
        ),
        ElevatedButton(
          onPressed: () {
            hatUpAnim!.fire();
          },
          child: Text("Hat Up"),
        ),
      ],
    );
  }
}
