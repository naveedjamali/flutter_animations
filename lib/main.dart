import 'package:flutter/material.dart';

main() {
  runApp(AnimationApp());
}

class AnimationApp extends StatefulWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  double height = 500;
  double width = 500;

  bool callingFirstTime = true;

  @override
  Widget build(BuildContext context) {
    if (callingFirstTime) {
      Future.delayed(const Duration(seconds: 2), () => setState(setDimension));
      callingFirstTime = false;
    }
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            // color: Colors.green,
            width: height,
            height: width,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: height,
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(setDimension);
      }),
    ));
  }

  setDimension() {
    if (height == 500) {
      height = width = 200;
    } else {
      height = width = 500;
    }

  }
}
