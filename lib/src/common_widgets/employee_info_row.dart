import 'package:admin_car_sales_management/src/common_widgets/show_toast.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmployeeInfoRow extends StatelessWidget {
  const EmployeeInfoRow({
    super.key,
    required this.fieldName,
    required this.fieldData,
  });

  final String fieldName;
  final String fieldData;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
            color: ColorStyle.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(fieldData),
            WidthMargin.minimum,
            (fieldName == '従業員ID')
                ? Tooltip(
                    message: 'コピー',
                    child: SizedBox(
                      width: 20,
                      height: 16,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: fieldData));
                            showToast(toastMessage: '従業員IDをコピーしました！');
                          },
                          child: const Icon(
                            Icons.copy,
                            color: ColorStyle.mainGrey,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 16),
          ],
        )
      ],
    );
  }
}
