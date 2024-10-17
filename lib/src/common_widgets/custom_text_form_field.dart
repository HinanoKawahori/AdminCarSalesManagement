import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';
import '../config/utils/style/height_margin.dart';
import '../config/utils/style/width_margin.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hight = 45,
    this.readOnly = false,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.validator,
    this.limit,
    this.counterText,
    this.inputFormatters,
    this.obscureText = false,
    this.text,
    this.path,
    this.isOutline = false,
    this.multipleLine,
  });

  final TextEditingController controller;
  final double hight;
  final bool readOnly;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? limit;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String? text;
  final String? path;
  final bool isOutline;
  final bool? multipleLine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null && path != null)
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.email),
                  WidthMargin.minimum,
                  Text(
                    text!,
                    style: const TextStyle(
                      fontSize: CustomFontSize.small,
                      color: ColorStyle.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              HeightMargin.small,
            ],
          ),
        SizedBox(
          height: hight,
          child: TextFormField(
            maxLength: limit,
            style: const TextStyle(
              fontSize: CustomFontSize.normal,
              color: ColorStyle.mainBlack,
            ),
            autofillHints: obscureText
                ? [AutofillHints.password]
                : [AutofillHints.username, AutofillHints.email],
            obscureText: obscureText,
            readOnly: readOnly,
            controller: controller,
            cursorColor: ColorStyle.mainGrey,
            cursorHeight: 17,
            validator: validator,
            onTap: onTap,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
            //文字数制限
            inputFormatters: inputFormatters ??
                [LengthLimitingTextInputFormatter(limit ?? 1000)],
            decoration: InputDecoration(
              fillColor: ColorStyle.hoverGrey,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),

              counterText: counterText,
              counterStyle: const TextStyle(
                color: ColorStyle.mainBlack,
              ),
              contentPadding: const EdgeInsets.only(left: 20),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: ColorStyle.mainGrey,
                fontSize: CustomFontSize.normal,
              ),

              // 選択されたときの枠線の色
              focusedBorder: isOutline
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorStyle.mainGrey),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,

              // 選択されていないときの枠線の色
              enabledBorder: isOutline
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorStyle.secondGrey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,

              //エラー時の枠線の色
              errorBorder: isOutline
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorStyle.validationRed,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,

              //エラー時にフォーカスされたときの枠線の色
              focusedErrorBorder: isOutline
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorStyle.validationRed,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
