import 'package:flutter/cupertino.dart';

import '../../constants/app_functions.dart';

extension CustomBox on double {
  Widget widthBox() {
    return SizedBox(
      width: this,
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: this,
    );
  }

  Widget scalableHeightBox() {
    return SizedBox(
      height: this * getScreenScaleFactor(),
    );
  }

}

extension CustomBox2 on int {
  Widget widthBox() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget heightBoxWithScale() {
    return SizedBox(
      height: this * getScreenScaleFactor(),
    );
  }

  Widget widthBoxWithScale() {
    return SizedBox(
      width: this * getScreenScaleFactor(),
    );
  }
}