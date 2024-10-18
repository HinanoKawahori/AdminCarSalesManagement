import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:flutter/material.dart';

class SalesRankingWidget extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {"rank": 1, "name": "近藤雅史", "amount": 29442289},
    {"rank": 2, "name": "田中正敏", "amount": 27443289},
    {"rank": 3, "name": "香川真司", "amount": 20443289},
    {"rank": 4, "name": "鈴木さり", "amount": 19443289},
    {"rank": 5, "name": "前川けいし", "amount": 19342289},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('従業員名', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('金額', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(color: ColorStyle.secondGrey),
              Expanded(
                child: ListView.builder(
                  itemCount: rankingData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${rankingData[index]["rank"]}. ${rankingData[index]["name"]}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${rankingData[index]["amount"].toStringAsFixed(0)}円',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
