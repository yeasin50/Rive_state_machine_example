import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StateMachineController? controller;

  SMIInput<double>? valueController;
  Artboard? _riveArtboard;

  double sliderVal = 0.0;

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
      setState(() {
        _riveArtboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
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
            Slider(
              value: sliderVal,
              onChanged: (value) {
                setState(() {
                  sliderVal = value;

                  if (valueController != null) {
                    valueController!.value = (sliderVal * 100.0);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
