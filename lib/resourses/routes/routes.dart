import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/view/home/home_view.dart';
import 'package:innovabe_solutions_api/view/login/login_view.dart';
import 'package:innovabe_solutions_api/view/register/register_view.dart';
import 'package:innovabe_solutions_api/view/splash_screen.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
          name: RoutesName.initialRoutes,
          page: () => const SplashScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),

        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),

        GetPage(
          name: RoutesName.registerView,
          page: () => const RegisterView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),

        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),

      ];
}
