import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final player = AudioCache();

  void playSound(int soundNum) {
    player.play('note$soundNum.wav');
  }

  final xyloColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildXyloBar(1),
              buildXyloBar(2),
              buildXyloBar(3),
              buildXyloBar(4),
              buildXyloBar(5),
              buildXyloBar(6),
              buildXyloBar(7),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildXyloBar(int soundNum) {
    return Expanded(
      child: FlatButton(
        color: xyloColors[soundNum - 1],
        onPressed: () {
          playSound(soundNum);
        },
      ),
    );
  }
}
