import 'package:flutter/material.dart';
import 'package:odev_6/data/entity/islemler.dart';
import 'package:odev_6/ui/card_sayfa.dart';
import 'package:odev_6/ui/odemeler_sayfa.dart';
import 'package:odev_6/ui/qr_sayfa.dart';
import 'package:odev_6/ui/transfer_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int secilenIndeks = 0;

  var sayfalar = [
    const Anasayfa(),
    const QrSayfa(),
    const TransferSayfa(),
    const OdemelerSayfa(),
    const CardSayfa(),
  ];

  Future<List<Islemler>> islemleriYukle() async {
    var islemListesi = <Islemler>[];
    var islem1 = Islemler(
        ucret: 100.0,
        islemAdi: "Vodafone",
        resim: "vodafone.png",
        aciklama: "Aralık Ayı Faturası");
    var islem2 = Islemler(
        ucret: 16500.0,
        islemAdi: "Garanti",
        resim: "garanti.jpg",
        aciklama: "Aralık Ayı Faturası");

    islemListesi.add(islem1);
    islemListesi.add(islem2);
    return islemListesi;
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran genisligi : ${ekranGenisligi}");
    print("Ekran yuksekligi : ${ekranYuksekligi}");

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          secilenIndeks = 0;
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print("Menü acildi");
            },
          ),
          title: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset("resimler/papara.png"),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('resimler/pp.jpg'),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        print("'-' tıklandı");
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      " ₺",
                      style: TextStyle(fontSize: 40),
                    ),
                    // güncellenecek
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        print("'+' tıklandı");
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                        size: 70,
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "IBAN : TR999999999999999999999999",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "SON İŞLEMLER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                FutureBuilder<List<Islemler>>(
                  future: islemleriYukle(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Veri getirme hatası'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('Mevcut veri yok'),
                      );
                    } else {
                      var islemlerListesi = snapshot.data!;
                      return SizedBox(
                        height: ekranYuksekligi / 2.2,
                        child: ListView.builder(
                          itemCount: islemlerListesi.length,
                          itemBuilder: (context, index) {
                            var islem = islemlerListesi[index];
                            return ListTile(
                              leading: SizedBox(
                                  height: ekranYuksekligi / 6,
                                  width: ekranGenisligi / 6,
                                  child:
                                      Image.asset("resimler/${islem.resim}")),
                              title: Text(
                                "${islem.islemAdi}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("${islem.aciklama}"),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                ListTile(
                  leading: SizedBox(
                      height: ekranYuksekligi / 2,
                      width: ekranGenisligi / 6,
                      child: Image.asset("resimler/steam.jpg")),
                  title: Text(
                    "Steam",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Her ay 25₺ kazan",
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: secilenIndeks,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (indeks) {
            setState(() {
              secilenIndeks = indeks;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => sayfalar[indeks])).then(
              (value) {
                setState(() {
                  secilenIndeks = 0;
                });
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Anasayfa",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: "Qr Karekod",
                activeIcon: Icon(Icons.qr_code)),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: "Para Transferi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: "Odemeler",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_outlined),
              label: "Papara Card",
            ),
          ],
        ),
      ),
    );
  }
}
