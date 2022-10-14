import 'package:get/get.dart';

import '../controllers/json_2_model_controller.dart';

class Json2ModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Json2ModelController>(
      () => Json2ModelController(),
    );
  }
}
