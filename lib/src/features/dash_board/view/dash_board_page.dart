import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/dash_board_card.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/widget/case_pie_chart_widget.dart';
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
        //TOOD
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
                          child: DashBoardCard(
                            contentWidget: Expanded(
                              child: CasePieChartWidget(),
                            ),
                            title: '稼働中の案件状況',
                          ),
                        ),
                        const SizedBox(height: 16),
                        //買取総額の推移
                        Expanded(
                          child: DashBoardCard(
                            contentWidget: Expanded(
                              child: CaseResultBarChartWidget(),
                            ),
                            title: '買取総額の推移',
                          ),
                        ),
                      ],
                    ),
                  ),
                  WidthMargin.smallNormal,
                  // 右側のカラム（1つのカード）
                  Expanded(
                    child: Card(
                      color: ColorStyle.lightBlue2,
                      child: Padding(
                        padding: PaddingStyle.medium,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Card(
                                    child: Text('dropdown'),
                                    color: ColorStyle.white,
                                  ),
                                ],
                              ),
                            ),

                            //8月の買取総額
                            const Expanded(
                              flex: 2,
                              child: DashBoardCard(
                                contentWidget: Expanded(
                                  child: SalesSumWidget(),
                                ),
                                title: '8月の買取総額',
                              ),
                            ),

                            //8月の人気買取メーカー
                            const Expanded(
                              flex: 4,
                              child: DashBoardCard(
                                contentWidget: Expanded(
                                    child: ManufacturerPieChartWidget()),
                                title: '8月の人気買取メーカー',
                              ),
                            ),

                            //8月の買取総額ランキング
                            Expanded(
                              flex: 4,
                              child: DashBoardCard(
                                contentWidget: Expanded(
                                  child: SalesRankingWidget(),
                                ),
                                title: '8月の買取総額ランキング',
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
