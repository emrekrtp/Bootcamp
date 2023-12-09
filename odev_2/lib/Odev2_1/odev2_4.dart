class HarfBul {
  int eHarfSayac(String kelime) {
    int sayac = 0;
    for (int i = 0; i < kelime.length; i++) {
      if (kelime[i] == "e" || kelime[i] == "E") {
        sayac++;
      }
    }
    return sayac;
  }
}
