import 'package:flutter/material.dart';
import 'package:odev_6/data/entity/kisiler.dart';

class OdemelerSayfa extends StatefulWidget {
  const OdemelerSayfa({super.key});

  @override
  State<OdemelerSayfa> createState() => _OdemelerSayfaState();
}

class _OdemelerSayfaState extends State<OdemelerSayfa> {
  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(
        kisi_id: 1,
        kisi_ad: "ENERJİSA",
        kisi_tel: "Ucret : 220 ₺");
    var k2 = Kisiler(
        kisi_id: 2,
        kisi_ad: "İSKİ",
        kisi_tel: "Ucret : 200 ₺");
    var k3 = Kisiler(
        kisi_id: 3,
        kisi_ad: "İGDAŞ",
        kisi_tel: "Ucret : 1200 ₺");
    var k4 = Kisiler(
        kisi_id: 4,
        kisi_ad: "INTERNET",
        kisi_tel: "Ucret : 280 ₺");

    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    kisilerListesi.add(k4);
    return kisilerListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ödemeler")),
      body: FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length, //3
              itemBuilder: (context, index) {
                // 0,1,2
                var kisi = kisilerListesi[index];
                return Card(
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kisi.kisi_ad,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(kisi.kisi_tel),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
