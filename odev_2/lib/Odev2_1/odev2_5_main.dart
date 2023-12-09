import 'dart:io';

import 'package:examples/Odev2_1/odev2_5.dart';

void main() {
  print("Kenar sayısı : ");
  int kenarAdedi = int.parse(stdin.readLineSync()!);
  IcAcilarToplami aci = new IcAcilarToplami();
  int toplamAci = aci.kenarSayisiHesapla(kenarAdedi);
  print("İç açılar toplamı : $toplamAci derece");
}
