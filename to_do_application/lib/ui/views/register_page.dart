import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/ui/cubit/home_page_cubit.dart';
import 'package:to_do_application/ui/cubit/register_page_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfNotIcerik = TextEditingController();
  var tfNotBaslik = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfNotIcerik,
                decoration: InputDecoration(hintText: "Not Basliği"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfNotBaslik,
                decoration: InputDecoration(hintText: "Not içeriği"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<KayitSayfaCubit>()
                    .kaydet(tfNotBaslik.text, tfNotIcerik.text);
              },
              child: Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
