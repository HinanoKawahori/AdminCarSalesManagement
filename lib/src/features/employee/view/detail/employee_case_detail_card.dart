import 'package:admin_car_sales_management/src/config/utils/key/firebase_key.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployeeCaseDetailCard extends StatelessWidget {
  const EmployeeCaseDetailCard({
    super.key,
    required this.contentWidget,
    required this.title,
    required this.employeeId,
  });
  final Widget contentWidget;
  final String title;
  final String? employeeId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PaddingStyle.normal,
        child: Column(
          children: [
            //タイトル
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ColorStyle.mainBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: CustomFontSize.large,
                  ),
                ),
                WidthMargin.normal,
                (title == '従業員情報')
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              context.goNamed(
                                AppRoute.addOrEditEmployee.name,
                                queryParameters: {
                                  FirebaseEmployeesKey.employeeId: employeeId,
                                },
                              );
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 24,
                              color: ColorStyle.mainGrey,
                            ),
                          ),
                        ),
                      )
                    : (title == '買取金額')
                        ? Expanded(
                            child: Container(
                              height: 1,
                              color: ColorStyle.secondGrey,
                            ),
                          )
                        : const SizedBox(width: 20, height: 20),
              ],
            ),
            HeightMargin.normal,
            //メインウィジェット
            contentWidget,
          ],
        ),
      ),
    );
  }
}
