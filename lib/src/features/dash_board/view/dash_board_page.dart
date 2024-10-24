import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/dash_board_card.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/year_and_month_drop_button.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/sales_ranking_dialog.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/active_case_count_widget.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/case_result_bar_chart_widget.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/manufacturer_pie_chart_widget.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/sales_ranking_widget.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/sales_sum_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../config/utils/style/color_style.dart';
import '../../../config/utils/style/custom_font_style.dart';

class DashBoardPage extends HookConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
        padding: PaddingStyle.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ダッシュボード',
              style: TextStyle(
                fontSize: CustomFontSize.largest,
                color: ColorStyle.mainBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            HeightMargin.normal,
            Expanded(
              child: Row(
                children: [
                  // 左側のカラム（2つのカード）
                  const Expanded(
                    child: Column(
                      children: [
                        //稼働中の案件状況
                        Expanded(
                          // flex: 4,
                          child: DashBoardCard(
                            contentWidget: Expanded(
                              child: ActiveCaseCountWidget(),
                            ),
                            title: '稼働中の案件状況',
                          ),
                        ),
                        //買取総額の推移
                        Expanded(
                          // flex: 6,
                          child: DashBoardCard(
                            contentWidget:
                                Expanded(child: CaseResultBarChartWidget()),
                            title: '買取総額の推移',
                          ),
                        ),
                      ],
                    ),
                  ),
                  WidthMargin.small,
                  // 右側のカラム（3つのカード）
                  Expanded(
                    child: Card(
                      color: const Color.fromARGB(255, 213, 233, 255),
                      child: Padding(
                        padding: PaddingStyle.normal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //ドロップダウンボタン
                            YearAndMonthDropButton(),
                            HeightMargin.normal,
                            //8月の買取総額
                            const SizedBox(
                              height: 80,
                              child: SalesSumWidget(),
                            ),

                            //8月の人気買取メーカー
                            const SizedBox(
                              height: 260,
                              child: DashBoardCard(
                                contentWidget: Expanded(
                                  child: ManufacturerPieChartWidget(),
                                ),
                                title: '8月の人気買取メーカー',
                              ),
                            ),

                            //8月の買取総額ランキング
                            Expanded(
                              child: InkWell(
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    //
                                    DashBoardCard(
                                      contentWidget: Expanded(
                                        child:
                                            SalesRankingWidget(isDialog: false),
                                      ),
                                      title: '8月の買取総額ランキング',
                                    ),
                                    //ランキングダイアログ表示ボタン
                                    Tooltip(
                                      message: '全従業員のランキング表示',
                                      child: Padding(
                                        padding: PaddingStyle.normal,
                                        child: IconButton(
                                          //ランキングダイアログの表示
                                          onPressed: () {
                                            showRankingDialog(
                                              context: context,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.open_in_new_rounded,
                                            color: ColorStyle.mainGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
