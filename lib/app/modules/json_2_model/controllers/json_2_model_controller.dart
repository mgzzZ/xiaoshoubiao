import 'dart:convert';

import 'package:get/get.dart';
import 'package:xiaoshoubiao/app/modules/json_2_model/controllers/template.dart';

class Json2ModelController extends GetxController {
  final type = 'normal'.obs;
  final error = ''.obs;
  final input = ''.obs;
  final output = ''.obs;
  final fileName = ''.obs;
  final className = ''.obs;

  Template get template {
    Map<String, dynamic> param = {};
    try {
      param = jsonDecode(input.value);
      error.value = '';
    } catch (e) {
      error.value = 'json结构错误,请检查!';
      update();
    }

    if (type.value == 'freezed') {
      return FreezedTemplate(
          fileName: fileName.value, className: className.value, param: param);
    }
    if (type.value == 'json_annotations') {
      return JsonAnnotationsTemplate(
          className: fileName.value, fileName: className.value, param: param);
    }

    return NormalTemplate(
        fileName: fileName.value, className: className.value, param: param);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void translation() {
    output.value = template.output;
    update();
  }
}
