import 'package:flutter/material.dart';

import '../../../../config/utils/style/color_style.dart';
import 'sales_data_text.dart';

class SalesHeaderTile extends StatelessWidget {
  const SalesHeaderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyle.blue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            children: [
              SalesDataText(title: '月'),
              SalesDataText(title: '成約'),
              SalesDataText(title: '失注'),
              SalesDataText(title: '成約率'),
            ],
          ),
        ),
      ),
    );
  }
}
