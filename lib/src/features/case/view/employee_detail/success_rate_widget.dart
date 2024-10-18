import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SuccessRateWidget extends ConsumerWidget {
  const SuccessRateWidget({
    super.key,
  });
  final int success = 40;
  final int lost = 73;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeightMargin.normal,
        Row(
          children: [
            Text(
              '平均成約率 ${(success / (success + lost) * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: CustomFontSize.largest,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HeightMargin.normal,
        SizedBox(
          // width: 800,
          child: CustomPaint(
            size: const Size(double.infinity, 24),
            painter: ProgressBarPainter(
              success: success,
              lost: lost,
            ),
          ),
        ),
        HeightMargin.normal,
        Row(
          children: [
            _buildLegendItem('成約', ColorStyle.pink, success),
            WidthMargin.normal,
            _buildLegendItem('失注', ColorStyle.secondGrey, lost),
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
  final int success;
  final int lost;

  ProgressBarPainter({
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
