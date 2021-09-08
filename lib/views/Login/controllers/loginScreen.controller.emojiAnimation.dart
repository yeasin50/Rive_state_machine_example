import 'package:rive/rive.dart';

/* Animations Name=> 
  idle,
  hatUp,
  hatDown,
  focusOnText,
  unFocusText,
  blink
*/

class EmojiAnimationController {
  final StateMachineController? controller;
  //* controller  inputs
  SMITrigger? _blinkAnim;
  SMITrigger? _focusOnTextAnim;
  SMITrigger? _unFocusFromText;
  SMITrigger? _hatDownAnim;
  SMITrigger? _hatUpAnim;
  SMIBool? _idleAnim;

  SMIInput<double>? _valueController;

  EmojiAnimationController(this.controller) {
    _locateInputs();
  }

  _locateInputs() {
    _valueController = controller!.findInput('value');

    _blinkAnim = controller!.findInput<bool>("blink") as SMITrigger;

    _focusOnTextAnim = controller!.findInput<bool>("focusOnText") as SMITrigger;

    _unFocusFromText = controller!.findInput<bool>("unFocusText") as SMITrigger;

    _hatDownAnim = controller!.findInput<bool>("hatDown") as SMITrigger;
    _hatUpAnim = controller!.findInput<bool>("hatUp") as SMITrigger;

    _idleAnim = controller!.findInput<bool>('idle') as SMIBool;
    _idleAnim!.value = true;
  }

  /// * Eyes movement 0-100
  followText(double value) {
    _valueController!.value = value;
  }

  idleAnimation(bool value) {
    _idleAnim!.value = value;
  }

  textFieldFocus(bool focus) {
    if (focus)
      _focusOnTextAnim!.fire();
    else
      _unFocusFromText!.fire();
  }

  hatDown(bool value) {
    if (value)
      _hatDownAnim!.fire();
    else
      _hatUpAnim!.fire();
  }

  ///TODO:  add Timer
  blinkEye(int? interval) async {
    _blinkAnim!.fire();
  }
}
