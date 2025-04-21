import 'package:get/get.dart';

import '../modules/KasRt/bindings/kas_rt_binding.dart';
import '../modules/KasRt/views/kas_rt_view.dart';
import '../modules/KasRw/bindings/kas_rw_binding.dart';
import '../modules/KasRw/views/kas_rw_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.KAS_RW,
      page: () => const KasRwView(),
      binding: KasRwBinding(),
    ),
    GetPage(
      name: _Paths.KAS_RT,
      page: () => KasRtView(),
      binding: KasRtBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
