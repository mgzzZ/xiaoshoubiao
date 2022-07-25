import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/7/25
/// Describe:
///

class MScrollView extends CustomScrollView {
  const MScrollView({Key? key, required List<SliverGrid> slivers})
      : super(key: key, slivers: slivers);
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: MyCustomScrollBehavior(), child: super.build(context));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
