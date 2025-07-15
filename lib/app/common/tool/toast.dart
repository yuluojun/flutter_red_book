import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Toast {
  static getToast(context, msg) {
    return showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.scale,
      position: StyledToastPosition.center,
    );
  }
}
