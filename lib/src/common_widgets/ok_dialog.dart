import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';

Future<void> okDialog({
  required BuildContext context,
  required String title,
  required String desc,
  VoidCallback? btnOkOnPress,
  bool? dismissOnTouchOutside,
}) async {
  await AwesomeDialog(
    width: 600,
    dismissOnTouchOutside: dismissOnTouchOutside ?? true,
    btnOkColor: ColorStyle.blue,
    btnOkText: '閉じる',
    btnOkOnPress: btnOkOnPress ?? () {},
    barrierColor: ColorStyle.mainWhite.withOpacity(0.3),
    context: context,
    dialogType: DialogType.success,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    titleTextStyle: const TextStyle(
      color: ColorStyle.mainGrey,
      fontWeight: FontWeight.bold,
      fontSize: CustomFontSize.normal,
      letterSpacing: 1.2,
    ),
    desc: desc,
    descTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorStyle.mainBlack,
      fontSize: CustomFontSize.normal,
      letterSpacing: 1.2,
    ),
    dialogBackgroundColor: ColorStyle.mainWhite.withOpacity(0.7),
  ).show();
}
