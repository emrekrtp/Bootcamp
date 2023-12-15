import 'package:flutter/material.dart';

class CardSayfa extends StatefulWidget {
  const CardSayfa({super.key});

  @override
  State<CardSayfa> createState() => _CardSayfaState();
}

class _CardSayfaState extends State<CardSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Papara Card"),
      ),
      body: Column(
        children: [
          Text("body"),
        ],
      ),
    );
  }
}
