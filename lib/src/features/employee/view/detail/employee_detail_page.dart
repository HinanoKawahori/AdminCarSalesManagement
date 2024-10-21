import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/view/employee_detail/personal_active_case_bar_widget.dart';
import 'package:admin_car_sales_management/src/features/case/view/employee_detail/personal_case_result_widget.dart';
import 'package:admin_car_sales_management/src/features/case/view/employee_detail/success_rate_widget.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/employee_case_detail_card.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/employee_info_widget.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/title_with_back_button.dart';
import '../../../case/view/employee_detail/personal_case_list_widget.dart';

class EmployeeDetailPage extends HookConsumerWidget {
  const EmployeeDetailPage({
    super.key,
    required this.employeeId,
  });
  final String? employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: PaddingStyle.normal,
      child: Scaffold(
        backgroundColor: ColorStyle.paleBlue,
        body: Column(
          children: [
            //タイトル/////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWithBackButton(
                  onPressed: () {
                    context.goNamed(AppRoute.employeeList.name);
                  },
                  title: '従業員詳細',
                ),
              ],
            ),
            HeightMargin.normal,
            // メインコンテンツ
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WidthMargin.normal,
                    SizedBox(
                      height: 750,
                      child: Row(
                        children: [
                          // 左側（従業員情報と営業成績）
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                //従業員情報/////////////////////////////////
                                Expanded(
                                  flex: 3,
                                  child: EmployeeCaseDetailCard(
                                    contentWidget: const EmployeeInfoWidget(),
                                    title: '従業員情報',
                                    employeeId: employeeId,
                                  ),
                                ),
                                HeightMargin.normal,
                                //営業成績/////////////////////////////////
                                Expanded(
                                  flex: 7,
                                  child: EmployeeCaseDetailCard(
                                    contentWidget: PersonalCaseResultWidget(),
                                    title: '買取金額',
                                    employeeId: employeeId,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WidthMargin.smallNormal,
                          // 右側（稼働中案件と稼働中案件一覧）
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                //稼働中案件/////////////////////////////////
                                Expanded(
                                  flex: 3,
                                  child: EmployeeCaseDetailCard(
                                    contentWidget:
                                        const PersonalActiveCaseBarWidget(),
                                    title: '稼働中案件',
                                    employeeId: employeeId,
                                  ),
                                ),
                                HeightMargin.normal,
                                //稼働中案件一覧/////////////////////////////////
                                Expanded(
                                  flex: 7,
                                  child: EmployeeCaseDetailCard(
                                    contentWidget: const Expanded(
                                      child: PersonalCaseListWidget(
                                        isPast: false,
                                      ),
                                    ),
                                    title: '稼働中案件一覧',
                                    employeeId: employeeId,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    HeightMargin.normal,
                    //成約率////////////////////////////////////////////////
                    SizedBox(
                      height: 220,
                      child: EmployeeCaseDetailCard(
                        contentWidget: const SuccessRateWidget(),
                        title: '成約率',
                        employeeId: employeeId,
                      ),
                    ),
                    HeightMargin.normal,
                    //営業履歴一覧/////////////////////////////////////////////
                    SizedBox(
                      height: 600,
                      child: EmployeeCaseDetailCard(
                        contentWidget: const Expanded(
                          child: PersonalCaseListWidget(
                            isPast: true,
                          ),
                        ),
                        title: '営業履歴一覧',
                        employeeId: employeeId,
                      ),
                    ),
                    // 必要に応じて、さらにコンテンツを追加できます
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
