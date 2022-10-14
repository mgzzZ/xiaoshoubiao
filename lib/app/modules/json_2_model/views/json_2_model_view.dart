import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/json_2_model_controller.dart';

class Json2ModelView extends GetView<Json2ModelController> {
  const Json2ModelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json 2 Model'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio<String>(
                            value: 'normal',
                            groupValue: controller.type.value,
                            onChanged: (v) {
                              controller.type.value = v!;
                            })),
                        Text('normal'),
                        Obx(() => Radio<String>(
                            value: 'freezed',
                            groupValue: controller.type.value,
                            onChanged: (v) {
                              controller.type.value = v!;
                            })),
                        Text('freezed'),
                        Obx(() => Radio<String>(
                            value: 'json_annotations',
                            groupValue: controller.type.value,
                            onChanged: (v) {
                              controller.type.value = v!;
                            })),
                        Text('json_annotations'),
                      ],
                    ),
                    OutlinedButton(onPressed: () {}, child: Text('转换')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    maxLines: 999,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: 999,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
