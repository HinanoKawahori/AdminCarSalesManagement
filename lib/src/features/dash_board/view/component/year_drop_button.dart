import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class YearDropButton extends HookConsumerWidget {
  final List<String> dropdownItems = ['2024', '2023', '2022'];

  YearDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValue = useState('2024'); // 初期値を設定

    return Container(
      height: 30,
      padding: PaddingStyle.horizontal,
      decoration: BoxDecoration(
        color: ColorStyle.white,
        border: Border.all(
          color: ColorStyle.secondGrey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue.value,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColorStyle.secondGrey,
          ), // アイコンの色
          style: const TextStyle(
            color: Colors.grey, // テキストの色
            fontSize: CustomFontSize.normal, // テキストのサイズ
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              dropdownValue.value = newValue;
            }
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
