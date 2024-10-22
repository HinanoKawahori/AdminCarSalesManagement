import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';

Future<void> errorDialog({
  required BuildContext context,
  required String title,
  required String desc,
}) async {
  await AwesomeDialog(
    width: 600,
    title: title,
    btnOkColor: ColorStyle.blue,
    btnOkText: '閉じる',
    btnOkOnPress: () {},
    barrierColor: ColorStyle.mainWhite,
    context: context,
    dialogType: DialogType.error,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    titleTextStyle: const TextStyle(
      color: ColorStyle.mainBlack,
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
