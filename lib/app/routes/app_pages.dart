import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/json_2_model/bindings/json_2_model_binding.dart';
import '../modules/json_2_model/views/json_2_model_view.dart';

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
      name: _Paths.JSON_2_MODEL,
      page: () => const Json2ModelView(),
      binding: Json2ModelBinding(),
    ),
  ];
}
