import 'package:flutter/material.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App Screen"),
        ),
        backgroundColor: Colors.red[100],
        body: SafeArea(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const CircleAvatar(
                radius: 90.0,
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/png/youtube.png'),
              ),
              const Text(
                'Youtube Premium',
                style: TextStyle(fontSize: 40, color: Colors.black45),
              ),
              const Text(
                'Watch videos unlimited.',
                style: TextStyle(fontSize: 35, color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 33.0),
                color: Colors.red[400],
                child: const ListTile(
                  leading: Icon(Icons.email, size: 35, color: Colors.white),
                  title: Text(
                    'contact@youtube.com',
                      style: TextStyle(fontSize: 25)
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 33.0),
                color: Colors.red[400],
                child: const ListTile(
                  leading: Icon(Icons.call, size: 35, color: Colors.white),
                  title: Text(
                    ' +1 650-253-0001',
                    style: TextStyle(fontSize: 25)
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
