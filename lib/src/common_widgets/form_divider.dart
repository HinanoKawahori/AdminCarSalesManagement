import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/padding_style.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: PaddingStyle.vertical,
      child: Divider(color: ColorStyle.secondGrey),
    );
  }
}
