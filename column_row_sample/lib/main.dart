import 'package:flutter/material.dart';

void main() => runApp(ColumnRow());

class ColumnRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 110,
                color: Colors.cyan[200],
                child: Text(
                  'Widgets',
                  textAlign: TextAlign.center,
                  style: (TextStyle(
                    fontSize: 60,
                    color: Colors.red[900],
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 150,
                    color: Colors.lime[300],
                    child: Text(
                      'Stateful Widgets',
                      style: TextStyle(
                          fontFamily: 'Indie Flower',
                          fontSize: 30,
                          color: Colors.indigo[900]),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    color: Colors.amber,
                    child: Text(
                      'Stateless Widgets',
                      style: TextStyle(
                          fontFamily: 'Indie Flower',
                          fontSize: 30,
                          color: Colors.indigo[900]),
                    ),
                  ),
                ],
              ),
              Container(
                height: 75,
                width: 150,
                color: Colors.indigoAccent,
                child: Text(
                  'My Home Page',
                  style: TextStyle(
                      fontFamily: 'Indie Flower',
                      fontSize: 35,
                      color: Colors.yellowAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 75,
                color: Colors.red[900],
                child: Text(
                  'Scaffold',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Indie Flower',
                      color: Colors.amber),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 175,
                    height: 75,
                    color: Colors.orange,
                    child: Text(
                      'Center',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red[900],
                          fontFamily: 'Indie Flower',
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 75,
                    color: Colors.pink,
                    child: const Text(
                      'AppBar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Indie Flower',
                          color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
