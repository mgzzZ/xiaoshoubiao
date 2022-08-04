import 'package:flutter/material.dart';
import 'package:xiaoshoubiao/feature/home/pages/home.dart';

///
/// Created by zgm on 2022/7/25
/// Describe:
///

class MRoutes {
  static Map<String, WidgetBuilder> routes = {home: (context) => const HomePage()};

  static const String home = '/home';
}
