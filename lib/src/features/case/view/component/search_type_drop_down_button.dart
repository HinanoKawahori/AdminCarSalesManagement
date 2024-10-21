import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/utils/style/color_style.dart';

class SearchTypeDropDownButton extends HookConsumerWidget {
  const SearchTypeDropDownButton({
    super.key,
    required this.selectedValue,
  });

  final ValueNotifier<String> selectedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: DropdownButton<String>(
        value: selectedValue.value,
        items: ['担当者', '顧客名'].map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(item),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            selectedValue.value = newValue;
          }
        },
        underline: const SizedBox(),
        hint: Text(
          selectedValue.value,
          style: const TextStyle(
            color: ColorStyle.secondGrey,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
      ),
    );
  }
}
