import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../config/utils/style/color_style.dart';
import '../../config/utils/style/custom_font_style.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final ValueChanged<int?>? onRowsPerPageChanged;
  final ValueChanged<int> onPageChanged;
  final DataTableSource source;
  final double? dataRowHeight;

  const CustomDataTable({
    super.key,
    required this.columns,
    this.onRowsPerPageChanged,
    required this.onPageChanged,
    required this.source,
    this.dataRowHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: ColorStyle.secondGrey,
      ),
      child: PaginatedDataTable2(
        minWidth: 1000,
        //UI
        headingRowHeight: 80,
        headingTextStyle: const TextStyle(
          color: ColorStyle.mainBlack,
          fontSize: CustomFontSize.normal,
          fontWeight: FontWeight.bold,
        ),
        dataRowHeight: 60,
        headingRowColor: WidgetStateProperty.all(ColorStyle.white),
        headingRowDecoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        horizontalMargin: 24,
        columnSpacing: 24,
        dataTextStyle: const TextStyle(
          color: ColorStyle.mainBlack,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),

        dividerThickness: 1,

        onRowsPerPageChanged: onRowsPerPageChanged,
        onPageChanged: onPageChanged,
        showFirstLastButtons: true,
        availableRowsPerPage: const [10, 30, 50],
        source: source,
        columns: columns,
      ),
    );
  }
}
