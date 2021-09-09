import 'package:rive/rive.dart';

/* Animations Name=> 
  idle,
  hatUp,
  hatDown,
  focusOnText,
  unFocusText,
  blink
*/
/// we dont need any provider because Rive controll it's state by itself :)
class EmojiAnimationController {
  static EmojiAnimationController? _instance;

  EmojiAnimationController._();

  static EmojiAnimationController get instance =>
      _instance ??= EmojiAnimationController._();

  StateMachineController? _controller;
  //* controller  inputs
  SMITrigger? _blinkAnim;
  SMITrigger? _focusOnTextAnim;
  SMITrigger? _unFocusFromText;
  SMITrigger? _hatDownAnim;
  SMITrigger? _hatUpAnim;
  SMIBool? _idleAnim;

  get isIdleAnimRunning => _idleAnim!.value;

  SMIInput<double>? _valueController;

  initInputs(StateMachineController controller) {
    this._controller = controller;

    this._valueController = controller.findInput('value');

    this._blinkAnim = controller.findInput<bool>("blink") as SMITrigger;

    this._focusOnTextAnim =
        controller.findInput<bool>("focusOnText") as SMITrigger;

    this._unFocusFromText =
        controller.findInput<bool>("unFocusText") as SMITrigger;

    this._hatDownAnim = controller.findInput<bool>("hatDown") as SMITrigger;
    this._hatUpAnim = controller.findInput<bool>("hatUp") as SMITrigger;

    this._idleAnim = controller.findInput<bool>('idle') as SMIBool;
    this._idleAnim!.value = true;
  }

  /// * Eyes movement 0-100
  followText(double value) {
    print(this._valueController == null);
    this._valueController!.value = value;
  }

  idleAnimation(bool value) {
    this._idleAnim!.value = value;
  }

  textFieldFocus(bool focus) {
    if (focus)
      this._focusOnTextAnim!.fire();
    else
      this._unFocusFromText!.fire();
  }

  hatDown(bool value) {
    if (value)
      this._hatDownAnim!.fire();
    else
      this._hatUpAnim!.fire();
  }

  ///TODO:  add Timer
  blinkEye() async {
    this._blinkAnim!.fire();
  }
}
