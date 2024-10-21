import 'package:admin_car_sales_management/src/common_widgets/blud_gradation_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/loading_widget.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/case_search_text_form_field.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab/case_tab_view.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab_title.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/table/case_tab_bar.dart';
import '../../../../common_widgets/title_with_back_button.dart';
import '../../../../config/enum/sales_status.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../config/utils/style/height_margin.dart';
import '../../data_model/case.dart';
import 'search_type_drop_down_button.dart';
import 'tab/all_case_tab_view.dart';

class CaseListView extends HookConsumerWidget {
  const CaseListView({
    super.key,
    required this.isPast,
  });
  final bool isPast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //タブコントローラー
    final TabController tabController = useTabController(initialLength: 5);
    final ValueNotifier<String> searchWord = useState('');
    final ValueNotifier<String> searchType = useState('担当者');

    return ref.watch(watchCaseListOfActiveStatusProvider).when(
      error: (error, stackTrace) {
        return ErrorWidget('データがありません');
      },
      loading: () {
        return const LoadingWidget(color: ColorStyle.blue);
      },
      data: (List<Case> caseList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////////////////////////上のタイトル、検索、案件新規追加ボタン////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isPast
                    ? TitleWithBackButton(
                        onPressed: () {
                          context.pop();
                        },
                        title: '案件履歴',
                      )
                    : const Text(
                        '案件一覧',
                        style: TextStyle(
                          fontSize: CustomFontSize.largest,
                          color: ColorStyle.mainBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                Row(
                  children: [
                    //検索切り替えドロップダウンボタン
                    SearchTypeDropDownButton(
                      searchType: searchType,
                    ),
                    WidthMargin.minimum,

                    //🔍検索テキストフォームフィールド
                    CaseSearchTextFormField(
                      caseList: const [],
                      searchWord: searchWord,
                      searchType: searchType,
                    ),
                    WidthMargin.small,
                    //営業結果一覧ページ遷移ボタン
                    isPast
                        ? Container()
                        : Container(
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // 縁の丸みを設定
                              color: ColorStyle.blue,
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.goNamed(AppRoute.pastCaseList.name);
                              },
                              icon: const Icon(
                                Icons.history,
                                color: ColorStyle.white,
                              ),
                            ),
                          ),
                  ],
                ),
                //➕従業員新規登録ボタン
                isPast
                    ? const SizedBox(
                        height: 40,
                        width: 200,
                      )
                    : BlueGradationButton(
                        onPressed: () {
                          context.goNamed(AppRoute.addOrEditCase.name);
                        },
                        title: '＋案件新規追加',
                      ),
              ],
            ),
            HeightMargin.large,
            //////////////////////////////////////////////案件一覧UI////////////////////////////////////////
            Expanded(
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
                            // タブ2「担当者未定」
                            TabTitle(
                                caseStatus: CaseStatus.assigningPerson.value),
                            // タブ3「日程調整中」
                            TabTitle(caseStatus: CaseStatus.scheduling.value),
                            // タブ4「訪問日確定」
                            TabTitle(
                                caseStatus: CaseStatus.confirmedVisit.value),
                            // タブ5「検討中」
                            TabTitle(caseStatus: CaseStatus.pending.value),
                          ],
                  ),
                  //タブ別のウィジェット表示
                  Expanded(
                    child: Padding(
                      padding: PaddingStyle.top,
                      child:

                          //TODO

                          isPast
                              ? TabBarView(
                                  controller: tabController,
                                  children: <Widget>[
                                    CaseTabView(
                                      caseStatus: CaseStatus.success,
                                      searchWord: searchWord,
                                    ),
                                    CaseTabView(
                                      caseStatus: CaseStatus.lost,
                                      searchWord: searchWord,
                                    ),
                                  ],
                                )
                              : TabBarView(
                                  controller: tabController,
                                  children: <Widget>[
                                    AllCaseTabView(
                                      searchWord: searchWord,
                                    ),
                                    CaseTabView(
                                      caseStatus: CaseStatus.assigningPerson,
                                      searchWord: searchWord,
                                    ),
                                    CaseTabView(
                                      caseStatus: CaseStatus.scheduling,
                                      searchWord: searchWord,
                                    ),
                                    CaseTabView(
                                      caseStatus: CaseStatus.confirmedVisit,
                                      searchWord: searchWord,
                                    ),
                                    CaseTabView(
                                      caseStatus: CaseStatus.pending,
                                      searchWord: searchWord,
                                    ),
                                  ],
                                ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
