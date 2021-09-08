import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class TextFieldWithRive extends StatefulWidget {
  TextFieldWithRive({Key? key}) : super(key: key);

  @override
  _TextFieldWithRiveState createState() => _TextFieldWithRiveState();
}

class _TextFieldWithRiveState extends State<TextFieldWithRive> {
  StateMachineController? controller;

  SMIInput<double>? valueController;
  Artboard? _riveArtboard;

  double sliderVal = 0.0;

  /// change value based on size>Width
  final double strengthOverTextFiled = 1.5;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    rootBundle.load("rives/eyeMovement.riv").then((value) async {
      final file = RiveFile.import(value);

      final artboard = file.mainArtboard;

      controller = StateMachineController.fromArtboard(artboard, "eyeMovement");

      if (controller != null) {
        print("got state");
        setState(() {
          artboard.addController(controller!);
          valueController = controller!.findInput('moevement_controll');
          controller!.inputs.forEach((element) {
            print(element.name);
          });
        });
      }

      _riveArtboard = artboard;
    });

    ///* eye controll with textFiled
    textEditingController.addListener(() {
      print(textEditingController.text);

      if (valueController != null) {
        valueController!.value =
            textEditingController.text.length * strengthOverTextFiled;
      }
    });
  }

  @override
  void dispose() {
    textEditingController.removeListener(() {});
    textEditingController.dispose();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxWidth * .5,
                width: constraints.maxWidth * .5,
                child: _riveArtboard == null
                    ? CircularProgressIndicator()
                    : Rive(
                        artboard: _riveArtboard!,
                      ),
              ),
              SizedBox(
                width: constraints.maxWidth * .8,
                child: TextField(
                  scrollPhysics: BouncingScrollPhysics(),
                  controller: textEditingController,
                  decoration: InputDecoration(hintText: "keep typing"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
