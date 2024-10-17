import 'package:flutter/material.dart';

import '../../config/utils/style/color_style.dart';
import '../../config/utils/style/width_margin.dart';
import '../form_must_mark.dart';

Widget FormInputField(String label, {bool isRequired = false}) {
  return SizedBox(
    width: 800,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
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
          width: 400,
          color: ColorStyle.white,
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    ),
  );
}
