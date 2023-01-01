import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imglist = [
    "assets/images/dice.png",
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
  ];

  List l1 = [];
  int i = 0, sum = 0;
  List rndlist = [];
  TextEditingController txtdata = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Dice App",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.amber),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: txtdata,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Enter how many dice",
                    style: TextStyle(color: Colors.amber),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  l1.clear();
                  rndlist.clear();
                  var data = txtdata.text;
                  int n = int.parse(data);

                  for (int i = 0; i < n; i++) {
                    setState(() {
                      l1.add(0);
                    });
                  }
                },
                child: Text("Generate")),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: l1
                    .asMap()
                    .entries
                    .map((e) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                            imglist[rndlist.isEmpty ? 0 : rndlist[e.key]],
                            height: 50,
                            width: 50,
                          ),
                    ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  rndlist.clear();
                  var rnd = Random();
                  int n = int.parse(txtdata.text);
                  for (i = 0; i < n; i++) {
                    var j = rnd.nextInt(6);
                    setState(() {
                      rndlist.add(j);
                    });
                  }
                },
                child: Text("Play"))
          ],
        ),
      ),
    );
  }
}
