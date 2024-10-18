import 'package:admin_car_sales_management/src/common_widgets/loading_widget.dart';
import 'package:admin_car_sales_management/src/config/firebase/firebase_instance_provider.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/features/auth/controller/auth_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common_widgets/confirm_dialog.dart';
import '../../../config/utils/style/color_style.dart';
import '../../routing/router_utils.dart';
import '../component/menu_list_tile.dart';

class NavigationRailShellPage extends HookConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationRailShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorStyle.paleBlue,
      body: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Adjust cross axis to start
        children: [
          Container(
            width: 240,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: ColorStyle.blueGradation,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: PaddingStyle.normal,
              child: Column(
                children: [
                  HeightMargin.normal,
                  // ロゴ

                  Image.asset(
                    'assets/images/logo_clear.png',
                    width: 80,
                    fit: BoxFit.contain,
                  ),

                  HeightMargin.normal,

                  // メニュー
                  Expanded(
                    child: NavigationRail(
                      minWidth: 200,
                      indicatorColor: ColorStyle.transparent,
                      backgroundColor: ColorStyle.transparent,
                      selectedIndex: navigationShell.currentIndex,
                      onDestinationSelected: (int index) {
                        navigationShell.goBranch(
                          index,
                          initialLocation:
                              index == navigationShell.currentIndex,
                        );
                      },
                      labelType: NavigationRailLabelType.none,
                      destinations: const [
                        //従業員一覧///////////////////////////////////////////////
                        NavigationRailDestination(
                          //選択中のアイコン
                          selectedIcon: MenuListTile(
                            isSelected: true,
                            title: '従業員一覧',
                            imagePath: 'assets/images/blue_people.png',
                          ),
                          icon: MenuListTile(
                            isSelected: false,
                            title: '従業員一覧',
                            imagePath: 'assets/images/white_people.png',
                          ),

                          label: Text('従業員一覧'),
                        ),
                        //ダッシュボード///////////////////////////////////////////////

                        NavigationRailDestination(
                          selectedIcon: MenuListTile(
                            isSelected: true,
                            title: 'ダッシュボード',
                            imagePath: 'assets/images/blue_dash_board.png',
                          ),
                          icon: MenuListTile(
                            isSelected: false,
                            title: 'ダッシュボード',
                            imagePath: 'assets/images/white_dash_board.png',
                          ),
                          label: Text('ダッシュボード'),
                        ),

                        //案件一覧///////////////////////////////////////////////
                        NavigationRailDestination(
                          selectedIcon: MenuListTile(
                            isSelected: true,
                            title: '案件一覧',
                            imagePath: 'assets/images/blue_car.png',
                          ),
                          icon: MenuListTile(
                            isSelected: false,
                            title: '案件一覧',
                            imagePath: 'assets/images/white_car.png',
                          ),
                          label: Text('案件一覧'),
                        ),
                      ],
                    ),
                  ),

                  //ログイン中の従業員情報
                  (ref.read(firebaseAuthProvider).currentUser == null)
                      ? Container()
                      : ref
                          .watch(watchEmployeeDataControllerProvider(
                              employeeId: ref
                                  .read(firebaseAuthProvider)
                                  .currentUser!
                                  .uid))
                          .when(
                          error: (error, stackTrace) {
                            return ErrorWidget('ユーザーが見つかりません');
                          },
                          loading: () {
                            return const LoadingWidget(color: ColorStyle.blue);
                          },
                          data: (employee) {
                            if (employee == null) {
                              return ErrorWidget('ユーザーが見つかりません');
                            }
                            return

                                // ログイン者の名前
                                SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.employeeName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    employee.email,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                  HeightMargin.normal,
                  // ログアウト
                  InkWell(
                    onTap: () {
                      confirmDialog(
                        context: context,
                        title: 'ログアウト',
                        desc: 'ログアウトしますか？',
                        btnOkOnPress: () async {
                          await ref
                              .read(authControllerProvider.notifier)
                              .signOut();
                          if (context.mounted) {
                            context.goNamed(AppRoute.login.name);
                          }
                        },
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'ログアウト',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeightMargin.normal,
                ],
              ),
            ),
          ),

          // Main content area
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }
}
