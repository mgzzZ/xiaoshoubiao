import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('Welcome home page'),
      ),
    );
  }
}
