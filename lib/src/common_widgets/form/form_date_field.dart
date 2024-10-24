import 'package:admin_car_sales_management/src/function/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/utils/style/color_style.dart';

class FormDateField extends ConsumerWidget {
  const FormDateField({
    super.key,
    required this.hintText,
    required this.birthDate,
    required this.onTap,
    required String label,
  });
  final String hintText;
  final VoidCallback onTap;
  final ValueNotifier<Timestamp?> birthDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          const Row(
            children: [
              Text(
                '生年月日',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.mainBlack,
                ),
              ),
            ],
          ),
          //テキストフォームフィールド
          Container(
            color: ColorStyle.white,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: (birthDate.value != null)
                    ? createDateText(birthDate.value!)
                    : hintText,
                labelStyle: const TextStyle(
                  color: ColorStyle.secondGrey,
                ),
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: ColorStyle.mainGrey,
                ),
              ),
              readOnly: true,
              //pickedDateでデータを取得
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
