import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List l1 = [
    "assets/images/dice.png",
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
  ];
  int i = 0, sum = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("LudoKIng"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  var R = Random();
                  setState(() {
                    i = R.nextInt(6);
                    print("$i");
                    sum = sum + i + 1;
                    print("$sum");
                  });
                },
                child: Image.asset(
                  l1[i],
                  height: 100,
                  width: 100,
                )),
          ),
        ],
      ),
    ));
  }
}
