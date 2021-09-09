import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

/* Animations Name=> 
  idle,
  hatUp,
  hatDown,
  focusOnText,
  unFocusText,
  blink
*/

final animControllNotifier = ChangeNotifierProvider<EmojiAnimationController>(
    (ref) => EmojiAnimationController());

class EmojiAnimationController with ChangeNotifier {
  StateMachineController? controller;
  //* controller  inputs
  SMITrigger? _blinkAnim;
  SMITrigger? _focusOnTextAnim;
  SMITrigger? _unFocusFromText;
  SMITrigger? _hatDownAnim;
  SMITrigger? _hatUpAnim;
  SMIBool? _idleAnim;

  SMIInput<double>? _valueController;

  initInputs({required StateMachineController controller}) {
    this.controller = controller;

    _valueController = controller.findInput('value');

    _blinkAnim = controller.findInput<bool>("blink") as SMITrigger;

    _focusOnTextAnim = controller.findInput<bool>("focusOnText") as SMITrigger;

    _unFocusFromText = controller.findInput<bool>("unFocusText") as SMITrigger;

    _hatDownAnim = controller.findInput<bool>("hatDown") as SMITrigger;
    _hatUpAnim = controller.findInput<bool>("hatUp") as SMITrigger;

    _idleAnim = controller.findInput<bool>('idle') as SMIBool;

    _idleAnim!.value = true;

    print("initINputs");

    notifyListeners();
  }

  /// * Eyes movement 0-100
  followText(double value) {
    _valueController!.value = value;

    notifyListeners();
  }

  idleAnimation(bool value) {
    _idleAnim!.value = value;

    notifyListeners();
  }

  textFieldFocus(bool focus) {
    if (focus)
      _focusOnTextAnim!.fire();
    else
      _unFocusFromText!.fire();

    notifyListeners();
  }

  hatDown(bool value) {
    if (value) {
      _hatDownAnim!.fire();

      notifyListeners();
    } else
      _hatUpAnim!.fire();

    notifyListeners();
  }

  ///TODO:  add Timer
  blinkEye(int? interval) async {
    print("blink ${_blinkAnim == null}");
    _blinkAnim!.fire();
    notifyListeners();
  }
}
