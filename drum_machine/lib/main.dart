import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const DrumApp());

class DrumApp extends StatelessWidget {
  const DrumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumMachine(),
      ),
    );
  }
}

class DrumMachine extends StatelessWidget {
  final player = AudioCache();

  DrumMachine({super.key});

  void playSound(String clap) {
    player.play('$clap.wav');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.amberAccent, 'sample-3s'),
                ),
                Expanded(
                  child: buildTextButton(Colors.blue, 'sample-3s'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.purpleAccent, 'clap'),
                ),
                Expanded(
                  child: buildTextButton(Colors.green, 'clap'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.deepOrangeAccent, 'clap'),
                ),
                Expanded(
                  child: buildTextButton(Colors.deepPurpleAccent, 'clap'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.red, 'how'),
                ),
                Expanded(
                  child: buildTextButton(Colors.lightGreenAccent, 'sample-3s'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.indigoAccent, 'sample-3s'),
                ),
                Expanded(
                  child: buildTextButton(Colors.pink, 'sample-3s'),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  TextButton buildTextButton(Color color, String voice) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
        child: Container(color: color),
        onPressed: () {
          playSound(voice);
        });
  }
}
