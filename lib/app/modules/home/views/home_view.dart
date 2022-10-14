import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaoshoubiao/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  '欢迎光临!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Obx(() {
                return Text(
                  '${controller.count}',
                  style: TextStyle(fontSize: 20),
                );
              }),
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.JSON_2_MODEL),
                  child: Text('json序列化')),
            ],
          ),
        ],
      ),
    );
  }
}
