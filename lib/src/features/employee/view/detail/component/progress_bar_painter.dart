import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:flutter/material.dart';

class ActiveCaseProgressBarPainter extends CustomPainter {
  final int inProgress;
  final int awaitingConfirmation;
  final int awaitingPayment;
  final int totalCases;

  ActiveCaseProgressBarPainter({
    required this.inProgress,
    required this.awaitingConfirmation,
    required this.awaitingPayment,
    required this.totalCases,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // 各セグメントの幅の計算
    double inProgressWidth = size.width * (inProgress / totalCases);
    double awaitingConfirmationWidth =
        size.width * (awaitingConfirmation / totalCases);
    double awaitingPaymentWidth = size.width * (awaitingPayment / totalCases);

    // "検討中"のセグメントを描画（右側に描画）
    paint.color = ColorStyle.lightBlue2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width - awaitingPaymentWidth,
          0,
          awaitingPaymentWidth,
          size.height,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    // "訪問日確定"のセグメントを描画（中央に描画）
    paint.color = ColorStyle.lightBlue;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width - awaitingPaymentWidth - awaitingConfirmationWidth,
          0,
          awaitingConfirmationWidth,
          size.height,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    // "日程調整中"のセグメントを描画（左側に描画）
    paint.color = ColorStyle.blue;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          inProgressWidth,
          size.height,
        ),
        const Radius.circular(5),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

//
class PastCaseProgressBarPainter extends CustomPainter {
  final int success;
  final int lost;

  PastCaseProgressBarPainter({
    required this.success,
    required this.lost,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final totalCases = success + lost;

    // 成約のセグメントを描画
    paint.color = ColorStyle.pink;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width * (success / totalCases), size.height),
        const Radius.circular(5),
      ),
      paint,
    );

    // 失注のセグメントを描画（成約の直後に）
    paint.color = ColorStyle.secondGrey;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * (success / totalCases),
          0,
          size.width * (lost / totalCases),
          size.height,
        ),
        const Radius.circular(5),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
