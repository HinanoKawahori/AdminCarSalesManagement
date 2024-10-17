// import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
// import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../config/utils/style/color_style.dart';

// class NavigationRailShellPage extends HookConsumerWidget {
//   final StatefulNavigationShell navigationShell;

//   const NavigationRailShellPage({
//     super.key,
//     required this.navigationShell,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: ColorStyle.paleBlue,
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 240,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: ColorStyle.blueGradation,
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Padding(
//               padding: PaddingStyle.normal,
//               child: Column(
//                 children: [
//                   //ロゴ
//                   Image.asset(
//                     'assets/images/logo_and_text.png',
//                     width: 80,
//                     fit: BoxFit.contain,
//                   ),
//                   HeightMargin.normal,
//                   //メニュー
//                   Expanded(
//                     child: NavigationRail(
//                       indicatorColor: ColorStyle.white,
//                       // indicatorShape: ,
//                       backgroundColor: ColorStyle.transparent,
//                       selectedIndex: navigationShell.currentIndex,
//                       onDestinationSelected: (int index) {
//                         navigationShell.goBranch(
//                           index,
//                           initialLocation:
//                               index == navigationShell.currentIndex,
//                         );
//                       },
//                       // labelType: NavigationRailLabelType.
//                       destinations: const [
//                         NavigationRailDestination(
//                           icon: Icon(Icons.people),
//                           label: Text('従業員一覧'),
//                         ),
//                         NavigationRailDestination(
//                           icon: Icon(Icons.dashboard_rounded),
//                           label: Text('ダッシュボード'),
//                         ),
//                         NavigationRailDestination(
//                           icon: Icon(Icons.car_repair),
//                           label: Text('案件一覧'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Text('ログイン者の名前'),
//                   //名前とログアウト
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.logout),
//                       Text('ログアウト'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: navigationShell,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:admin_car_sales_management/src/common_widgets/loading_widget.dart';
import 'package:admin_car_sales_management/src/config/firebase/firebase_instance_provider.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/features/auth/controller/auth_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common_widgets/confirm_dialog.dart';
import '../../../config/utils/style/color_style.dart';
import '../../routing/router_utils.dart';

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
                  // ロゴ
                  Image.asset(
                    'assets/images/logo_and_text.png',
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
                      destinations: [
                        NavigationRailDestination(
                          //TODO　figmaの画像貼り付ける
                          selectedIcon: Image.asset(
                            'assets/images/employee_list_selected.png',
                            width: 160,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          icon: Image.asset(
                            'assets/images/employee_list_un_selected.png',
                            width: 130,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          label: const Text('従業員一覧'),
                        ),
                        NavigationRailDestination(
                          selectedIcon: Image.asset(
                            'assets/images/dash_board_selected.png',
                            width: 160,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          icon: Image.asset(
                            'assets/images/dash_board_un_selected.png',
                            width: 130,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          label: const Text('ダッシュボード'),
                        ),
                        NavigationRailDestination(
                          selectedIcon: Image.asset(
                            'assets/images/case_list_selected.png',
                            width: 160,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          icon: Image.asset(
                            'assets/images/case_list_un_selected.png',
                            width: 130,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          label: const Text('案件一覧'),
                        ),
                      ],
                    ),
                  ),

                  //TODO curretnUser != null

                  ref
                      .watch(watchEmployeeDataControllerProvider(
                          employeeId:
                              ref.read(firebaseAuthProvider).currentUser!.uid))
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
