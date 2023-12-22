import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/repo/notsdao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit() : super(0);

  var nrepo = NotsDaoRepository();

  Future<void> guncelle(int id, String name, String comment) async {
    await nrepo.guncelle(id, name, comment);
  }
}
