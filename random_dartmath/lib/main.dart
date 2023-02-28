import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int img1 = 1;
  int img2 = 2;
  int img3 = 3;

  void changePicture() {
    img1 = Random().nextInt(5) + 1;
    img2 = Random().nextInt(5) + 1;
    img3 = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: const Text('Nature Pics'),
        titleTextStyle: const TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold ),

        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),

            Expanded(
              child: buildImage(img1.toString()),
            ),
            Expanded(
                child: buildImage(img2.toString())
            ),
            Expanded(
                child: buildImage(img3.toString())
            ),
            Expanded(
              child: Container(),
            ),

            Card(
              color: Colors.lightGreen,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListTile(
                leading: const Icon(Icons.arrow_forward, color: Colors.white,size: 32.0),
                title:  const Text(
                  'Change Pictures',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),

                onTap: () {
                  setState(
                        () {
                      changePicture();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Image buildImage(String imageNo) {
    return Image.asset('assets/jpeg/img$imageNo.jpeg');

  }
}