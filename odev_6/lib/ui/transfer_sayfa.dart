import 'package:flutter/material.dart';

import '../data/entity/kisiler.dart';

class TransferSayfa extends StatefulWidget {
  const TransferSayfa({super.key});

  @override
  State<TransferSayfa> createState() => _TransferSayfaState();
}

class _TransferSayfaState extends State<TransferSayfa> {
  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(
        kisi_id: 1,
        kisi_ad: "Ahmet",
        kisi_tel: "IBAN : TR111111111111111111111111");
    var k2 = Kisiler(
        kisi_id: 2,
        kisi_ad: "Zeynep",
        kisi_tel: "IBAN : TR222222222222222222222222");
    var k3 = Kisiler(
        kisi_id: 3,
        kisi_ad: "Beyza",
        kisi_tel: "IBAN : T3333333333333333333333333");
    var k4 = Kisiler(
        kisi_id: 4,
        kisi_ad: "Ali",
        kisi_tel: "IBAN : TR444444444444444444444444");

    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    kisilerListesi.add(k4);
    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfer")),
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
