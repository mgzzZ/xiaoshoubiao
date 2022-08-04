import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xiaoshoubiao/base/widget/scrollview.dart';

///
/// Created by zgm on 2022/7/25
/// Describe:
///

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MScrollView(
      slivers: [
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.primaries[Random().nextInt(6)],
                  child: Center(
                    child: Text('$index'),
                  ),
                );
              },
              childCount: 100,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 16 / 9))
      ],
    ));
  }
}
