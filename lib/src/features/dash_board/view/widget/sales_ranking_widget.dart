import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesRankingWidget extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {"rank": 1, "name": "近藤雅史", "amount": 29442289},
    {"rank": 2, "name": "田中正敏", "amount": 27443289},
    {"rank": 3, "name": "香川真司", "amount": 20443289},
    {"rank": 4, "name": "鈴木さり", "amount": 19443289},
    {"rank": 5, "name": "前川けいし", "amount": 19342289},
    {"rank": 6, "name": "近藤雅史", "amount": 29442289},
    {"rank": 7, "name": "田中正敏", "amount": 27443289},
    {"rank": 8, "name": "香川真司", "amount": 20443289},
    {"rank": 9, "name": "鈴木さり", "amount": 19443289},
    {"rank": 10, "name": "前川けいし", "amount": 19342289},
    {"rank": 11, "name": "近藤雅史", "amount": 29442289},
    {"rank": 12, "name": "田中正敏", "amount": 27443289},
    {"rank": 13, "name": "香川真司", "amount": 20443289},
    {"rank": 14, "name": "鈴木さり", "amount": 19443289},
    {"rank": 15, "name": "前川けいし", "amount": 19342289},
  ];

  //数字にカンマを入れるフォーマッターを作成
  final formatter = NumberFormat('#,##0');

  SalesRankingWidget({
    super.key,
    required this.isDialog,
  });
  final bool isDialog;
  // SizedBox(width: (isDialog) ? 20 : 0),
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //タイトル//////////////////////////////////////
        HeightMargin.small,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: (isDialog) ? 60 : 20),
            const SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //従業員名
                  Text(
                    '従業員名',
                    style: TextStyle(
                      fontSize: CustomFontSize.normal,
                    ),
                  ),
                ],
              ),
            ),
            //金額
            const Padding(
              padding: PaddingStyle.right,
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WidthMargin.small,
                    Text(
                      '金額',
                      style: TextStyle(
                        fontSize: CustomFontSize.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const Padding(
          padding: PaddingStyle.small,
          child: Divider(
            color: ColorStyle.secondGrey,
          ),
        ),
        //ランキング//////////////////////////////////////
        Expanded(
          child: ListView.builder(
            physics: isDialog
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemCount: rankingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: (isDialog) ? 20 : 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ランキング番号
                    SizedBox(
                      width: (isDialog) ? 60 : 20,
                      child: Center(
                        child: Text(
                          '${rankingData[index]["rank"]}',
                          style: const TextStyle(
                            fontSize: CustomFontSize.normal,
                          ),
                        ),
                      ),
                    ),
                    //従業員名
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${rankingData[index]["name"]}',
                            style: const TextStyle(
                              fontSize: CustomFontSize.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //金額
                    Padding(
                      padding: PaddingStyle.right,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${formatter.format(rankingData[index]["amount"])}円',
                              style: const TextStyle(
                                fontSize: CustomFontSize.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
