import 'package:flutter/material.dart';
import 'dart:math';
import 'bandit.dart';

void main() {
  runApp(const BanditManchotApp());
}

class BanditManchotApp extends StatelessWidget {
  const BanditManchotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bandit Manchot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Bandit(),
    );
  }
}