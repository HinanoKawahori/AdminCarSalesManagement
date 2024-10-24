import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/utils/style/color_style.dart';
import '../../config/utils/style/width_margin.dart';
import '../form_must_mark.dart';

class FormDropdownField extends ConsumerWidget {
  const FormDropdownField({
    super.key,
    required this.title,
    required this.label,
    required this.items,
    required this.isRequired,
    required this.onChanged,
  });
  final String title;
  final String? label;
  final List<String> items;
  final bool isRequired;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.mainBlack,
                ),
              ),
              WidthMargin.normal,
              isRequired ? const FormMustMark() : Container(),
            ],
          ),
          Container(
            color: ColorStyle.white,
            width: 300,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                // labelText: label,
                // labelStyle: const TextStyle(
                //   color: ColorStyle.secondGrey,
                // ),
                border: OutlineInputBorder(),
              ),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
