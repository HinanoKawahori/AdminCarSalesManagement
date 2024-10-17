import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:admin_car_sales_management/src/features/auth/repo/auth_repo.dart';
import 'package:admin_car_sales_management/src/features/auth/view/login_page.dart';
import 'package:admin_car_sales_management/src/features/employee/view/add/add_employee_page.dart';
import 'package:admin_car_sales_management/src/features/employee/view/employee_list_page.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/employee_detail_page.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/dash_board_page.dart';
import 'package:admin_car_sales_management/src/features/case/view/case_list_page.dart';
import 'package:admin_car_sales_management/src/features/case/view/past_case_list_page.dart';
import 'package:admin_car_sales_management/src/features/case/view/add_or_edit/add_or_edit_case_page.dart';
import '../../config/utils/key/firebase_key.dart';
import '../navigation/navigation_rail/navigation_rail.dart';
import 'go_router_refresh_stream.dart';
import 'router_utils.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> sectionNavigatorKey =
    GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.login.path,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepoProvider.notifier).authStateChange(),
    ),
    redirect: (context, state) {
      if (ref.read(authRepoProvider) == null &&
          state.location != AppRoute.login.path) {
        return AppRoute.login.path;
      }
      return null;
    },
    routes: [
      //ログインページ
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationRailShellPage(navigationShell: navigationShell);
        },
        branches: [
          //従業員一覧ページ
          StatefulShellBranch(
            navigatorKey: sectionNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.employeeList.path,
                name: AppRoute.employeeList.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: EmployeeListPage()),
                routes: [
                  //従業員作成編集画面
                  GoRoute(
                    path: AppRoute.addOrEditEmployee.path,
                    name: AppRoute.addOrEditEmployee.name,
                    pageBuilder: (context, state) {
                      final String? employeeId = state
                          .queryParameters[FirebaseCasesKey.assignedEmployeeId];

                      return NoTransitionPage(
                        child: AddOrEditEmployeePage(employeeId: employeeId),
                      );
                    },
                  ),
                  //従業員詳細ページ
                  GoRoute(
                    path: AppRoute.employeeDetail.path,
                    name: AppRoute.employeeDetail.name,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: EmployeeDetailPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //ダッシュボードページ
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.dashBoard.path,
                name: AppRoute.dashBoard.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: DashBoardPage()),
              ),
            ],
          ),
          //案件一覧ページ
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.caseList.path,
                name: AppRoute.caseList.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CaseListPage()),
                routes: [
                  //過去の案件一覧ページ
                  GoRoute(
                    path: AppRoute.pastCaseList.path,
                    name: AppRoute.pastCaseList.name,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: PastCaseListPage()),
                  ),
                  //案件作成編集画面
                  GoRoute(
                    path: AppRoute.addOrEditCase.path,
                    name: AppRoute.addOrEditCase.name,
                    pageBuilder: (context, state) {
                      final String? caseId =
                          state.queryParameters[FirebaseCasesKey.caseId];

                      return NoTransitionPage(
                        child: AddOrEditCasePage(caseId: caseId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
