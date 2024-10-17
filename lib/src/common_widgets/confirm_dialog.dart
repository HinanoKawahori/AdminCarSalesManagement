import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';

Future<void> confirmDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required VoidCallback btnOkOnPress,
}) async {
  await AwesomeDialog(
    width: 400,
    btnOkColor: ColorStyle.blue,
    btnOkText: 'はい',
    btnOkOnPress: btnOkOnPress,
    btnCancelText: 'いいえ',
    btnCancelColor: ColorStyle.mainGrey,
    btnCancelOnPress: () {},
    barrierColor: ColorStyle.mainWhite.withOpacity(0.3),
    context: context,
    dialogType: DialogType.question,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    titleTextStyle: const TextStyle(
      color: ColorStyle.mainBlack,
      fontWeight: FontWeight.bold,
      fontSize: CustomFontSize.large,
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
