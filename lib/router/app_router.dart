import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Home.page),
    AutoRoute(page: Signin.page),
    AutoRoute(page: Signup.page),
    AutoRoute(page: ReportProblem.page),
    AutoRoute(page: ForgotPassword.page),
    AutoRoute(page: Opining.page, initial: true),
  ];
}
