import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';

Future<void> warningDialog({
  required BuildContext context,
  required String text,
}) async {
  await AwesomeDialog(
    btnOkColor: ColorStyle.blue,
    btnOkText: '閉じる',
    btnOkOnPress: () {},
    barrierColor: ColorStyle.mainWhite.withOpacity(0.3),
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    titleTextStyle: const TextStyle(
      color: ColorStyle.blue,
      fontWeight: FontWeight.bold,
      fontSize: CustomFontSize.normal,
      letterSpacing: 1.2,
    ),
    desc: text,
    descTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorStyle.mainBlack,
      fontSize: CustomFontSize.normal,
      letterSpacing: 1.2,
    ),
    dialogBackgroundColor: ColorStyle.mainWhite.withOpacity(0.7),
  ).show();
}
