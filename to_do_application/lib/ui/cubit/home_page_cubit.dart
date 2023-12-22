import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/entity/notlar.dart';
import 'package:to_do_application/data/repo/notsdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Notlar>> {
  AnasayfaCubit() : super(<Notlar>[]);

  var nrepo = NotsDaoRepository();

  Future<void> notlarYazdir() async {
    var liste = await nrepo.notlariYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await nrepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int id) async {
    var liste = await nrepo.sil(id);
    await notlarYazdir();
  }
}
