import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/screens/home/home_screen.dart';
import 'package:find_the_bomb_app/screens/loading/loading_screen.dart';
import 'package:find_the_bomb_app/screens/onboarding/onboarding_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}