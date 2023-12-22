import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/repo/notsdao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit() : super(0);

  var nrepo = NotsDaoRepository();

  Future<void> kaydet(String name, String comment) async {
    await nrepo.ekle(name, comment);
  }
}
