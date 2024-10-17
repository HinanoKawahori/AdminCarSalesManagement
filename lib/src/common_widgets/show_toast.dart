import 'package:fluttertoast/fluttertoast.dart';

import '../config/utils/style/custom_font_style.dart';

bool isToastShowing = false;
void showToast({
  required String toastMessage,
  String? position,
  int timeInSecForIosWeb = 5,
}) {
  if (isToastShowing) return;
  isToastShowing = true;
  //表示時間
  // int timeInSecForIosWeb = 5;
  Fluttertoast.showToast(
    msg: toastMessage,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: timeInSecForIosWeb,
    fontSize: CustomFontSize.largest,
    webPosition: position ?? 'right',
    webBgColor: "linear-gradient(to right, #424242, #616161)", //グレー
  ).then((_) {
    Future.delayed(Duration(seconds: timeInSecForIosWeb), () {
      isToastShowing = false;
    });
  });
}
