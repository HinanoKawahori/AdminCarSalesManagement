import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/utils/style/color_style.dart';

class FormDateField extends ConsumerWidget {
  const FormDateField({
    super.key,
    required this.label,
    // required this.birthDate,/
  });
  final String label;
  // final ValueNotifier birthDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
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
                labelText: label,
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
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              onChanged: (newValue) {
                // birthDate.value = newValue;
                //TODO ここを変更する
              },
            ),
          ),
        ],
      ),
    );
  }
}
