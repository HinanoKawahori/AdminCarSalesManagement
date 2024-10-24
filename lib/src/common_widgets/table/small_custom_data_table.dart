import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SmallCustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final ValueChanged<int?>? onRowsPerPageChanged;
  final ValueChanged<int> onPageChanged;
  final DataTableSource source;
  final double? dataRowHeight;

  const SmallCustomDataTable({
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
        dividerColor: ColorStyle.hoverGrey,
      ),
      child: PaginatedDataTable2(
        // minWidth: 1000,
        //UI
        headingRowHeight: 32,
        headingTextStyle: const TextStyle(
          color: ColorStyle.mainBlack,
          fontSize: CustomFontSize.normal,
          fontWeight: FontWeight.bold,
        ),
        dataRowHeight: 32,
        headingRowColor: WidgetStateProperty.all(ColorStyle.white),
        headingRowDecoration: const BoxDecoration(
          border: Border(),
          color: ColorStyle.hoverGrey,
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
          fontSize: 12,
        ),

        dividerThickness: 0.2,

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
