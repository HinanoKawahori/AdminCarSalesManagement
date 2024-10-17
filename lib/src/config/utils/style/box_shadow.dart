import 'package:flutter/material.dart';

import 'color_style.dart';

final BoxShadow customBoxShadow = BoxShadow(
  color: ColorStyle.mainGrey.withOpacity(0.6),
  offset: const Offset(3, 3),
  blurRadius: 4.0,
  spreadRadius: 1.0,
);

const BoxShadow tileBoxShadow = BoxShadow(
  color: ColorStyle.darkBlue,
  offset: Offset(0, 2),
  blurRadius: 2.0,
);
