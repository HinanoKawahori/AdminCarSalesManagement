import 'package:flutter/material.dart';

import '../../config/utils/style/color_style.dart';
import '../../config/utils/style/width_margin.dart';
import '../form_must_mark.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.title,
    required this.labelText,
    required this.isRequired,
    required this.controller,
    required this.isCaseForm,
    this.maxLine,
  });

  final String title;
  final String labelText;
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
            width: isCaseForm ? 300 : 300,
            color: ColorStyle.white,
            child: TextField(
              style: const TextStyle(color: ColorStyle.mainBlack),
              maxLines: maxLine,
              decoration: InputDecoration(
                labelText: labelText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorStyle.mainGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
