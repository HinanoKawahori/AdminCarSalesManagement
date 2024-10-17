enum AppRoute {
  login,
  employeeList,
  addEmployee,
  employeeDetail,
  employeePastDetail,
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
      case AppRoute.addEmployee:
        return '/addEmployee';
      case AppRoute.employeeDetail:
        return 'employeeDetail';
      case AppRoute.employeePastDetail:
        return 'employeePastDetail';
      case AppRoute.caseList:
        return '/caseList';
      case AppRoute.pastCaseList:
        return 'pastCaseList';
      case AppRoute.addOrEditCase:
        return '/addOrEditCase';
      case AppRoute.dashBoard:
        return '/dashBoard';
    }
  }
}
