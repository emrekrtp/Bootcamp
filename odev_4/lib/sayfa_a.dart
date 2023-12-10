import 'package:flutter/material.dart';
import 'package:odev_4/sayfa_b.dart';
import 'package:odev_4/sayfa_y.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SayfaB()));
              },
              child: Text("Sayfa B"),
            ),
          ],
        ),
      ),
    );
  }
}
