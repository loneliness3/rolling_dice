import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int yLuckyNum = 1;
  int gLuckyNum = 1;
  int bLuckyNum = 1;
  int blLuckyNum = 1;
  var winner;

  yellowLuck() {
    setState(() {
      yLuckyNum = 3;
      yLuckyNum = Random().nextInt(6) + 1;
    });
  }

  greenLuck() {
    setState(() {
      gLuckyNum = 5;
      gLuckyNum = Random().nextInt(6) + 1;
    });
  }

  blackLuck() {
    setState(() {
      bLuckyNum = Random().nextInt(6) + 1;
    });
  }

  blueLuck() {
    setState(() {
      blLuckyNum = 4;
      blLuckyNum = Random().nextInt(6) + 1;
    });
  }

  considerWinner() {
    if (yLuckyNum > gLuckyNum &&
        yLuckyNum > bLuckyNum &&
        yLuckyNum > blLuckyNum) {
      return "Yellow";
    } else if (gLuckyNum > yLuckyNum &&
        gLuckyNum > bLuckyNum &&
        gLuckyNum > blLuckyNum) {
      return "Green";
    } else if (bLuckyNum > yLuckyNum &&
        bLuckyNum > gLuckyNum &&
        bLuckyNum > blLuckyNum) {
      return "Black";
    } else if (blLuckyNum > yLuckyNum &&
        blLuckyNum > gLuckyNum &&
        blLuckyNum > bLuckyNum) {
      return "Blue";
    } else {
      return "No one";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Final Round",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'IndieFlower',
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  yellowLuck();
                },
                child: Image(
                  image: AssetImage('images/dice$yLuckyNum.png'),
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
              InkWell(
                onTap: () {
                  greenLuck();
                },
                child: Image(
                  image: AssetImage('images/dice$gLuckyNum.png'),
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  blackLuck();
                },
                child: Image(
                  image: AssetImage('images/dice$bLuckyNum.png'),
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  blueLuck();
                  winner = considerWinner();
                },
                child: Image(
                  image: AssetImage('images/dice$blLuckyNum.png'),
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Material(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
            child: Text(
              '$winner is the Winner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
