import 'package:flutter/material.dart';
import 'dart:math';

class Bandit extends StatefulWidget {
  const Bandit({super.key});

  @override
  _BanditState createState() => _BanditState();
}

class _BanditState extends State<Bandit> {
  List<String> images = [
      'images/bar.png',
      'images/cerise.png',
      'images/cloche.png',
      'images/diamant.png',
      'images/fer-a-cheval.png',
      'images/pasteque.png',
      'images/sept.png',
  ];

  List<String> selectedSymbols = [];
  bool jackpot = false;

  void jouerBandit() {
    setState(() {
      selectedSymbols.clear();
      for (int i = 0; i < 3; i++) {
        int randomIndex = Random().nextInt(images.length);
        selectedSymbols.add(images[randomIndex]);
      }
      if (selectedSymbols.toSet().length == 1 && selectedSymbols[0] == 'cerise.png') {
        jackpot = true;
      } else {
        jackpot = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandit Manchot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: selectedSymbols
                  .map((images) => 
                  Image.asset(
                        images,
                        width: 50,
                        height: 100,
                      ))
                  .toList(),
            ),
            ElevatedButton(
              onPressed: jouerBandit,
              child: const Text('Jouez'),
            ),
            if (jackpot)
              const Text(
                'JACKPOT !',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              )
            else if (selectedSymbols.toSet().length == 1)
              const Text(
                'JACKPOT!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              )
            else
              const Text(
                'PERDU, retentez votre chance!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
