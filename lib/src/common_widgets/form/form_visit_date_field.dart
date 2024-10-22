import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../config/utils/style/color_style.dart';

class FormVisitDateField extends ConsumerWidget {
  const FormVisitDateField({
    super.key,
    required this.label,
  });
  final String label;

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
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: ColorStyle.mainGrey,
                ),
              ),
              readOnly: true,
              onTap: () async {
                await _selectDateTimeFromDialog(
                  ref,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//日付時間選択
  Future<void> _selectDateTimeFromDialog(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final DateTime? pickedDateTime = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 400,
            height: 600,
            child: OmniDateTimePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              is24HourMode: true,
              minutesInterval: 15,
              isShowSeconds: false,
              type: OmniDateTimePickerType.dateAndTime,
              onDateTimeChanged: (DateTime value) {
                //TODO 値を変更
              },
            ),
          ),
        );
      },
    );

    if (pickedDateTime != null) {
      // Handle the selected date and time
    }
  }
}
