import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ColorStyle {
  static const mainWhite = Color(0xFFFAFAFA);

  static const white = Colors.white;
  static const link = Colors.purple;

  static const transparent = Colors.transparent;

  static const mainBlack = Color.fromARGB(255, 77, 77, 77);

  static const mainGrey = Color.fromARGB(255, 141, 141, 141);

  static const secondGrey = Color.fromARGB(255, 195, 195, 195);

  static const hoverGrey = Color.fromARGB(255, 235, 235, 235);

  static const blue = Color.fromARGB(255, 46, 143, 255);

  static const lightBlue = Color.fromARGB(255, 115, 161, 255);

  static const lightBlue2 = Color.fromARGB(255, 184, 208, 255);

  static const darkBlue = Color(0xFF586DAA);

  static const paleBlue = Color.fromARGB(255, 247, 248, 255);

  static const pink = Colors.pink;

  static const validationRed = Color.fromARGB(255, 206, 53, 53);

  ///円グラフの色（案件）

  static const pieChartAssigningPerson = Color.fromARGB(255, 150, 150, 150);
  static const pieChartScheduling = Color(0xFF82CFFD);
  static const pieChartConfirmedVisit = Color(0xFF80E6E0);
  static const pieChartPending = Color(0xFFB099FF);
//円グラフの色（メーカー）
  static const pieChartFirst = Color(0xFFF48FB1);
  static const pieChartSecond = Color(0xFFFFB74D);
  static const pieChartThird = Color(0xFFFF8A65);
  static const pieChartForth = Colors.yellow;

  static const confirmedVisitButton = [
    Color.fromARGB(255, 30, 200, 190), // ダークターコイズ
    Color.fromARGB(255, 80, 230, 220), // 明るめのアクア
    Color.fromARGB(255, 148, 238, 232) // 明るめのアクア
  ];

  static const pendingButton = [
    Color.fromARGB(255, 140, 110, 230), // 柔らかい紫
    Color.fromARGB(255, 160, 130, 240), // 優しい紫
    Color.fromARGB(255, 202, 182, 252) // 淡い紫
  ];

  static const schedulingButton = [
    Color.fromARGB(255, 50, 175, 245),
    Color.fromARGB(255, 75, 190, 250),
    Color.fromARGB(255, 158, 221, 255)
  ];

  static const successButton = [
    Color.fromARGB(255, 255, 85, 160),
    Color.fromARGB(255, 254, 126, 190),
  ];

  static const lostButton = [
    Color.fromARGB(255, 144, 144, 144),
    Color.fromARGB(255, 172, 172, 172)
  ];

  static const blueGradation = [
    Color.fromARGB(255, 46, 143, 255),
    Color.fromARGB(255, 46, 143, 255),
    Color.fromARGB(255, 179, 214, 255),
  ];

  static const backGroundColor = [
    Color(0xFFF7F9FF),
    Color(0xFFE7EBF8),
  ];

  static var pieChartDarkBlue;
}
