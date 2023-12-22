import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/entity/notlar.dart';
import 'package:to_do_application/ui/cubit/detail_page_cubit.dart';
import 'package:to_do_application/ui/cubit/home_page_cubit.dart';
import 'package:to_do_application/ui/cubit/register_page_cubit.dart';
import 'package:to_do_application/ui/views/home_page.dart';

class DetaySayfa extends StatefulWidget {
  Notlar not;

  DetaySayfa({required this.not});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfnotBaslik = TextEditingController();
  var tfNotIcerik = TextEditingController();

  @override
  void initState() {
    super.initState();
    var not = widget.not;
    tfnotBaslik.text = not.name;
    tfNotIcerik.text = not.icerik;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tfnotBaslik,
              decoration: InputDecoration(
                hintText: tfnotBaslik.text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tfNotIcerik,
              decoration: InputDecoration(
                hintText: tfNotIcerik.text,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<DetaySayfaCubit>()
                  .guncelle(widget.not.id, tfnotBaslik.text, tfNotIcerik.text)
                  .then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
            child: Text("Kaydet"),
          ),
        ],
      ),
    );
  }
}
