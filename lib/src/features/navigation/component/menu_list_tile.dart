import 'package:flutter/material.dart';

import '../../../config/utils/style/color_style.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.imagePath,
  });
  final bool isSelected;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorStyle.white : ColorStyle.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? ColorStyle.blue : ColorStyle.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
