import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Yukseklik : $ekranYuksekligi");
    print("Genislik : $ekranGenisligi");

    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.home,
          size: 40,
          color: Colors.orange,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white70,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text("skip"),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60, left: 20),
            child: Text(
              "Find best place \n"
                  "to stay in good price ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur \n"
                  "adipiscing elit, sed",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 536,
                width: 420,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: const Image(
                        image: AssetImage("assets/resim1.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 100,
                      left: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white70,
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {},
                        child: Text("Next"),
                      ),
                    ),
                    Positioned(
                      bottom: 39,
                      right: 100,
                      left: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.maximize,
                          size: 80,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
