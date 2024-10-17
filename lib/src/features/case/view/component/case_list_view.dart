import 'package:admin_car_sales_management/src/common_widgets/blud_gradation_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/loading_widget.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab/case_tab_view.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab_title.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/table/case_tab_bar.dart';
import '../../../../config/enum/sales_status.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../config/utils/style/height_margin.dart';
import '../../../employee/view/component/detail_screen/search_text_form_field.dart';
import '../../data_model/case.dart';
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
    final ValueNotifier<List<Employee>> searchEmployeeList = useState([]);
    final TextEditingController searchController = useTextEditingController();
    final ValueNotifier<String> _selectedValue = useState('担当者');

    return ref.watch(watchCaseListOfActiveStatusProvider).when(
      error: (error, stackTrace) {
        return ErrorWidget('データがありません');
      },
      loading: () {
        return const LoadingWidget(color: ColorStyle.blue);
      },
      data: (List<Case> allActiveCaseList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //上の検索類
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isPast
                    ? Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          WidthMargin.small,
                          const Text(
                            '案件履歴',
                            style: TextStyle(
                              fontSize: CustomFontSize.largest,
                              color: ColorStyle.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        '案件一覧',
                        style: TextStyle(
                          fontSize: CustomFontSize.largest,
                          color: ColorStyle.mainBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                //TODO テキストフォームフィールドのコンポーネントを作る

                Row(
                  children: [
                    //検索切り替えドロップダウンぼたん
                    Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: ColorStyle.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: PaddingStyle.normal,
                      child: DropdownButton<String>(
                        value: _selectedValue.value,
                        items: ['担当者', '顧客名'].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(item),
                            ),
                            // child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _selectedValue.value = newValue;
                          }
                        },
                        underline: const SizedBox(),
                        hint: Text(
                          _selectedValue.value,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: CustomFontSize.small),
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                    WidthMargin.small,

                    //🔍検索テキストフォームフィールド
                    SearchTextFormField(
                      employeeList: [],
                      searchEmployeeList: searchEmployeeList,
                      searchController: searchController,
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
                      child: isPast
                          ? TabBarView(
                              controller: tabController,
                              children: const <Widget>[
                                CaseTabView(
                                  caseStatus: CaseStatus.success,
                                ),
                                CaseTabView(
                                  caseStatus: CaseStatus.lost,
                                ), //日程調整中
                              ],
                            )
                          : TabBarView(
                              controller: tabController,
                              children: const <Widget>[
                                AllCaseTabView(), //すべて
                                CaseTabView(
                                  caseStatus: CaseStatus.assigningPerson,
                                ),
                                CaseTabView(
                                  caseStatus: CaseStatus.scheduling,
                                ), //日程調整中
                                CaseTabView(
                                  caseStatus: CaseStatus.confirmedVisit,
                                ),
                                CaseTabView(
                                  caseStatus: CaseStatus.pending,
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
