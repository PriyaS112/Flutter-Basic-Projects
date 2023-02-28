import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const GestureAnimationPage(),
    );
  }
}

class GestureAnimationPage extends StatefulWidget {
  const GestureAnimationPage({super.key});

  @override
  _GestureAnimationPageState createState() => _GestureAnimationPageState();
}

class _GestureAnimationPageState extends State<GestureAnimationPage>
    with SingleTickerProviderStateMixin {
  int tapsCount = 0;
  int doubleTapsCount = 0;
  int longPressCount = 0;
  double xPosition = 0.0;
  double yPosition = 0.0;
  double boxSize = 0.0;
  double fullBoxSize = 150.0;

  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10000),
    );
    animation = CurvedAnimation(
      parent: controller!,
      curve: Curves.decelerate,
    );
    animation!.addListener(() {
      setState(() {
        boxSize = fullBoxSize * animation!.value;
      });
      centerBox(context);
    });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (xPosition == 0.0) {
      centerBox(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures and Animations'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            tapsCount++;
          });
        },
        onDoubleTap: () {
          setState(() {
            doubleTapsCount++;
          });
        },
        onLongPress: () {
          setState(() {
            longPressCount++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dy;
            yPosition += delta;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dx;
            xPosition += delta;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Container(
                width: boxSize,
                height: boxSize,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            "Tap: $tapsCount, Double Tap: $doubleTapsCount, Long Press: $longPressCount",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void centerBox(BuildContext context) {
    xPosition = MediaQuery.of(context).size.width / 2 - boxSize / 2;
    yPosition = MediaQuery.of(context).size.height / 2 - boxSize / 2 - 50;
    setState(() {
      xPosition = xPosition;
      yPosition = yPosition;
    });
  }
}