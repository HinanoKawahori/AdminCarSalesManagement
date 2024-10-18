import 'package:flutter/material.dart';

import '../../config/utils/style/color_style.dart';
import '../../config/utils/style/width_margin.dart';
import '../form_must_mark.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.label,
    required this.isRequired,
    required this.controller,
    required this.isCaseForm,
    this.maxLine,
  });

  final String label;
  final bool isRequired;
  final TextEditingController controller;
  final bool isCaseForm;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
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
            width: isCaseForm ? 300 : 300,
            color: ColorStyle.white,
            child: TextField(
              maxLines: maxLine,
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
}
