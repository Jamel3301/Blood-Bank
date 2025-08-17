import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Map.page),
    AutoRoute(page: Signin.page),
    AutoRoute(page: FirstSignup.page),
    AutoRoute(page: SecondSignup.page),
    AutoRoute(page: Profile.page),
    AutoRoute(page: BloodBank.page, initial: true),
    AutoRoute(page: RequestList.page),
    AutoRoute(page: ReportProblem.page),
    AutoRoute(page: ForgotPassword.page),
  ];
}
