import 'package:flutter/material.dart';
import 'flags.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AustriaFlag.routeName: (context) => const AustriaFlag(),
        FranceFlag.routeName: (context) => const FranceFlag(),
        BelgiumFlag.routeName: (context) => const BelgiumFlag(),
        SwitzerlandFlag.routeName: (context) => const SwitzerlandFlag(),
        JapanFlag.routeName: (context) => const JapanFlag(),
        CameroonFlag.routeName: (context) => const CameroonFlag(),
        PanamaFlag.routeName: (context) => const PanamaFlag(),
      },
    );
  }
}

class HomePage extends StatelessWidget{
  static String routeName ='/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flags with Stacks'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AustriaFlag.routeName);
                },
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
                child: const Text(
                  'Austria',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, BelgiumFlag.routeName);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow, primary: Colors.black),
                child: const Text(
                  'Belgium',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, FranceFlag.routeName);
                },
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.blue[900]),
                child: const Text(
                  'France',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SwitzerlandFlag.routeName);
                },
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
                child: const Text(
                  'Switzerland',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, JapanFlag.routeName);},
                style: TextButton.styleFrom(
                    primary: Colors.red, backgroundColor: Colors.white),
                child: const Text(
                  'Japan',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, CameroonFlag.routeName);},
                style: TextButton.styleFrom(
                    primary: const Color(0xfffcd116), backgroundColor: const Color(0xff007a5e)),
                child: const Text(
                  'Cameroon',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, PanamaFlag.routeName);},
                style: TextButton.styleFrom(
                    primary: const Color(0xff072357), backgroundColor: Colors.white),
                child: const Text(
                  'Panama',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
