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
    DateTime? selectedDate;
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
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                // await _selectDateTimeFromDialog(
                //   ref,
                //   context,
                // );
                final DateTime? pickedDateTime = await showOmniDateTimePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  is24HourMode: true,
                  minutesInterval: 15,
                  theme: ThemeData(
                    dialogBackgroundColor: ColorStyle.white,
                    colorScheme: const ColorScheme.light(
                      primary: ColorStyle.blue, // 選択された日付の色
                      onPrimary: ColorStyle.white, // 選択された日付のテキスト色
                    ),
                    timePickerTheme: TimePickerThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    buttonTheme: const ButtonThemeData(
                      height: 50,
                    ),
                    dividerColor: ColorStyle.mainGrey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//日付時間選択
  // Future<void> _selectDateTimeFromDialog(
  //   WidgetRef ref,
  //   BuildContext context,
  // ) async {
  //   final DateTime? pickedDateTime = await showOmniDateTimePicker(
  //     context: context,
  //     initialDate: ref.read(visitDateControllerProvider) != null
  //         ? ref.read(visitDateControllerProvider)!.toDate()
  //         : DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //     is24HourMode: true,
  //     minutesInterval: 15,
  //     theme: ThemeData(
  //       dialogBackgroundColor: ColorStyle.white,
  //       colorScheme: const ColorScheme.light(
  //         primary: ColorStyle.blue, // 選択された日付の色
  //         onPrimary: ColorStyle.white, // 選択された日付のテキスト色
  //       ),
  //       timePickerTheme: TimePickerThemeData(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //       ),
  //       buttonTheme: const ButtonThemeData(
  //         height: 50,
  //       ),
  //       dividerColor: ColorStyle.mainGrey,
  //     ),
  //   );

  //   if (pickedDateTime != null) {
  //     ref
  //         .read(visitDateControllerProvider.notifier)
  //         .stateChange(Timestamp.fromDate(pickedDateTime));
  //   }
  // }
}
