import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonalActiveCaseBarWidget extends ConsumerWidget {
  const PersonalActiveCaseBarWidget({
    super.key,
  });
  final int totalCases = 66;
  final int inProgress = 40;
  final int awaitingConfirmation = 10;
  final int awaitingPayment = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeightMargin.normal,
        Row(
          children: [
            Text(
              '案件数  $totalCases件',
              style: const TextStyle(
                fontSize: CustomFontSize.largest,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HeightMargin.normal,
        CustomPaint(
          size: const Size(double.infinity, 24),
          painter: ProgressBarPainter(
            inProgress: inProgress,
            awaitingConfirmation: awaitingConfirmation,
            awaitingPayment: awaitingPayment,
            totalCases: totalCases,
          ),
        ),
        HeightMargin.normal,
        Row(
          children: [
            _buildLegendItem('日程調整中', Colors.blue, inProgress),
            WidthMargin.normal,
            _buildLegendItem('訪問日確定', Colors.lightBlue, awaitingConfirmation),
            WidthMargin.normal,
            _buildLegendItem('検討中', const Color(0xFFE3F2FD), awaitingPayment),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color, int count) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        WidthMargin.small,
        Text('$label $count'),
      ],
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final int inProgress;
  final int awaitingConfirmation;
  final int awaitingPayment;
  final int totalCases;

  ProgressBarPainter({
    required this.inProgress,
    required this.awaitingConfirmation,
    required this.awaitingPayment,
    required this.totalCases,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // 各セグメントの幅の計算
    double awaitingPaymentWidth = size.width * (awaitingPayment / totalCases);
    double awaitingConfirmationWidth =
        size.width * (awaitingConfirmation / totalCases);
    double inProgressWidth = size.width * (inProgress / totalCases);

    // "検討中"のセグメントを描画（左側に最初に描画）
    paint.color = const Color(0xFFE3F2FD); // 検討中
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, awaitingPaymentWidth, size.height), // 左から描画
        const Radius.circular(5),
      ),
      paint,
    );

    // "訪問日確定"のセグメントを描画
    paint.color = Colors.lightBlue; // 訪問日確定
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            awaitingPaymentWidth, 0, awaitingConfirmationWidth, size.height),
        const Radius.circular(5),
      ),
      paint,
    );

    // "日程調整中"のセグメントを描画（最後に右側に）
    paint.color = Colors.blue; // 日程調整中
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          awaitingPaymentWidth + awaitingConfirmationWidth,
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
