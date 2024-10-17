import 'package:flutter/material.dart';

import 'box_shadow.dart';
import 'color_style.dart';

final BoxDecoration cardBoxDecoration = BoxDecoration(
  color: ColorStyle.white,
  borderRadius: BorderRadius.circular(6),
  boxShadow: const [
    tileBoxShadow,
  ],
);

final BoxDecoration cardBlueBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: ColorStyle.blueGradation,
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    tileBoxShadow,
  ],
);

const BoxDecoration floatingActionButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
  gradient: LinearGradient(
    colors: ColorStyle.blueGradation,
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

final BoxDecoration tileBoxDecoration = BoxDecoration(
  color: ColorStyle.white,
  borderRadius: BorderRadius.circular(6),
  boxShadow: const [
    tileBoxShadow,
  ],
);
