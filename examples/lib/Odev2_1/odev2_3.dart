class Faktoriyel {
  int faktoriyel = 1;

  int faktoriyelHesapla(int sayi) {
    for (int i = 1; i <= sayi; i++) {
      faktoriyel *= i;
    }
    return faktoriyel;
  }
}
