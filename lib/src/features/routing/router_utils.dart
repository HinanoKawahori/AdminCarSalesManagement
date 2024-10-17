enum AppRoute {
  login,
  employeeList,
  addOrEditEmployee,
  employeeDetail,
  caseList,
  pastCaseList,
  addOrEditCase,
  dashBoard,
}

extension AppRouterExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.login:
        return '/login';
      case AppRoute.employeeList:
        return '/employeeList';
      case AppRoute.addOrEditEmployee:
        return 'addOrEditEmployee';
      case AppRoute.employeeDetail:
        return 'employeeDetail';
      case AppRoute.caseList:
        return '/caseList';
      case AppRoute.pastCaseList:
        return 'pastCaseList';
      case AppRoute.addOrEditCase:
        return 'addOrEditCase';
      case AppRoute.dashBoard:
        return '/dashBoard';
    }
  }
}
