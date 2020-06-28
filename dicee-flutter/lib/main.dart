import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final randomizer = Random();
  var left = 1;
  var right = 1;

  void randomDie(String side) {
    setState(() {
      final randomDieInt = randomizer.nextInt(6) + 1;
      if (side == 'left') {
        left = randomDieInt;
      } else {
        right = randomDieInt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    randomDie('left');
                  },
                  child: Image.asset('images/dice$left.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    randomDie('right');
                  },
                  child: Image.asset('images/dice$right.png'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          elevation: 6,
          shape: RoundedRectangleBorder(
              side: BorderSide(
            color: Colors.green,
            width: 1,
          )),
          color: Colors.red.shade700,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          onPressed: () {
            randomDie('left');
            randomDie('right');
          },
          child: Text(
            'Roll the dice!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
