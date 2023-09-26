import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceePage(),
    );
  }
}


class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void changeDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Dicee',
        style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(child:
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: ElevatedButton(
                onPressed: (){
                  changeDice();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(0)
                ),
                child: Image.asset('assets/dice$leftDiceNumber.png')
                ),
             )
             ),
            Expanded(child:
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(0)
                ),
                onPressed: (){
                  changeDice();
                },
                child: Image.asset('assets/dice$rightDiceNumber.png'),
                ),
             )
             )
          ],
        ),
      ),
    );
  }
}
