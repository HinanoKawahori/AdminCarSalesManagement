import 'package:admin_car_sales_management/src/common_widgets/table/case_tab_bar.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab/personal_case_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/enum/sales_status.dart';
import '../../../../config/utils/style/padding_style.dart';
import '../component/tab/personal_all_case_tab_view.dart';
import '../component/tab_title.dart';

class PersonalCaseListWidget extends HookConsumerWidget {
  const PersonalCaseListWidget({
    super.key,
    required this.isPast,
  });
  final bool isPast;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
      initialLength: isPast ? 2 : 4,
    );
    return SizedBox(
      child: Column(
        children: [
          //ステータス切り替えのタブ
          CaseTabBar(
            tabController: tabController,
            tabs: isPast
                ? [
                    // タブ1「成約」
                    TabTitle(caseStatus: CaseStatus.success.value),
                    // タブ2「失注」
                    TabTitle(caseStatus: CaseStatus.lost.value),
                  ]
                : [
                    // タブ1「すべて」
                    const TabTitle(caseStatus: 1),
                    // タブ3「日程調整中」
                    TabTitle(caseStatus: CaseStatus.scheduling.value),
                    // タブ4「訪問日確定」
                    TabTitle(caseStatus: CaseStatus.confirmedVisit.value),
                    // タブ5「検討中」
                    TabTitle(caseStatus: CaseStatus.pending.value),
                  ],
          ),
          //タブ別のウィジェット表示
          Expanded(
            child: Padding(
              padding: PaddingStyle.top,
              child: isPast
                  ? TabBarView(
                      controller: tabController,
                      children: const <Widget>[
                        PersonalCaseTabView(
                          caseStatus: CaseStatus.success,
                        ),
                        PersonalCaseTabView(
                          caseStatus: CaseStatus.lost,
                        ), //日程調整中
                      ],
                    )
                  : TabBarView(
                      controller: tabController,
                      children: const <Widget>[
                        //すべて
                        PersonalAllCaseTabView(),
                        //日程調整中
                        PersonalCaseTabView(
                          caseStatus: CaseStatus.scheduling,
                        ),
                        //訪問日確定
                        PersonalCaseTabView(
                          caseStatus: CaseStatus.confirmedVisit,
                        ),
                        //検討待ち
                        PersonalCaseTabView(
                          caseStatus: CaseStatus.pending,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
