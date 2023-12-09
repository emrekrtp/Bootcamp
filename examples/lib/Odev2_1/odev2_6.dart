import 'dart:io';

class Odev6 {
  void maasHesapla(int gun) {
    int saat = gun * 8;
    double normalMaas = saat * 40;

    print(normalMaas);
    if (saat > 150) {
      double mesaiUcreti = (saat - 150) * 80;
    }
  }
}
