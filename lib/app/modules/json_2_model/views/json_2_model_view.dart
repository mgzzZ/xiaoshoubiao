import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/json_2_model_controller.dart';

class Json2ModelView extends GetView<Json2ModelController> {
  const Json2ModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController output = TextEditingController();
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
                        const Text('normal'),
                        Obx(() => Radio<String>(
                            value: 'freezed',
                            groupValue: controller.type.value,
                            onChanged: (v) {
                              controller.type.value = v!;
                            })),
                        const Text('freezed'),
                        Obx(() => Radio<String>(
                            value: 'json_annotations',
                            groupValue: controller.type.value,
                            onChanged: (v) {
                              controller.type.value = v!;
                            })),
                        const Text('json_annotations'),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Text(
                              controller.error.value,
                              style: TextStyle(color: Colors.red),
                            )),
                        const SizedBox(
                          width: 12,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              controller.translation();
                              output.text = controller.output.value;
                            },
                            child: Text('转换')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 44,
                child: Row(
                  children: [
                    const Text('文件名:'),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                        width: 200,
                        child: TextField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (v) => controller.fileName.value = v,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('类名:'),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                        width: 200,
                        child: TextField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (v) => controller.className.value = v,
                        )),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),onChanged: (v){
                      controller.input.value = v;
                      },
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      controller: output,
                      maxLines: 999,
                      decoration: const InputDecoration(
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
