import 'package:flutter/material.dart';

class QrSayfa extends StatefulWidget {
  const QrSayfa({super.key});

  @override
  State<QrSayfa> createState() => _QrSayfaState();
}

class _QrSayfaState extends State<QrSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr"),
      ),
      body: Column(
        children: [
          Image.asset("resimler/aa.png"),
        ],
      ),
    );
  }
}
