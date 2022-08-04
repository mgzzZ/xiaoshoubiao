import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xiaoshoubiao/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小手表',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '小手表'),
      routes: MRoutes.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        ScreenType type = ScreenUtil.getCurScreenType(width);

        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return LeftDrawer(
                  type: type,
                );
              }),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(type.name),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: '点击',
            child: const Icon(Icons.timer),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      });
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MRoutes.home);
              },
              child: const Text(
                '小手表点击了:',
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '点击',
        child: const Icon(Icons.timer),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum ScreenType { max, normal, h5 }

class ScreenUtil {
  static ScreenType getCurScreenType(double width) {
    if (width > 768) {
      return ScreenType.max;
    } else if (width <= 768 && width > 500) {
      return ScreenType.normal;
    } else {
      return ScreenType.h5;
    }
  }
}

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key, required this.type}) : super(key: key);
  final ScreenType type;
  @override
  Widget build(BuildContext context) {
    double width = 0;
    switch (type) {
      case ScreenType.max:
        width = 200;
        break;
      case ScreenType.normal:
        width = 100;
        break;
      default:
    }

    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      child: Container(
        width: width,
        height: double.infinity,
        color: Colors.blue,
        child: Container(
          height: 100,
          child: Row(
            children: [
              const Icon(Icons.access_time_filled_outlined),
              if (ScreenType.max == type) ...[Text('左边栏')],
            ],
          ),
        ),
      ),
    );
  }
}
