import 'package:flutter/material.dart';

import '../../../../config/utils/style/box_decoration.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: cardBoxDecoration,
        child: child,
      ),
    );
  }
}
