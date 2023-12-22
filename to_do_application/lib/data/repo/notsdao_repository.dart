import 'package:to_do_application/data/entity/notlar.dart';
import 'package:to_do_application/sqlite/veritabani_yardimcisi.dart';

class NotsDaoRepository {
  Future<void> ekle(String name, String comment) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var yeniNot = Map<String, dynamic>();
    yeniNot["name"] = name;
    yeniNot["comment"] = comment;
    await db.insert("toDos", yeniNot);
  }

  Future<void> guncelle(int id, String name, String comment) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncellenenNot = Map<String, dynamic>();
    guncellenenNot["name"] = name;
    guncellenenNot["comment"] = comment;
    await db.update("toDos", guncellenenNot, where: "id = ?", whereArgs: [id]);
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("toDos", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Notlar>> notlariYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Notlar(
          id: satir["id"], name: satir["name"], icerik: satir["comment"]);
    });
  }

  Future<List<Notlar>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Notlar(
          id: satir["id"], name: satir["name"], icerik: satir["icerik"]);
    });
  }
}
