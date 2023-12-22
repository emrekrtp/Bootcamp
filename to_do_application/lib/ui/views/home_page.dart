import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/entity/notlar.dart';
import 'package:to_do_application/ui/cubit/home_page_cubit.dart';
import 'package:to_do_application/ui/cubit/register_page_cubit.dart';
import 'package:to_do_application/ui/views/detail_page.dart';
import 'package:to_do_application/ui/views/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool arama = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().notlarYazdir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),
      body: BlocBuilder<AnasayfaCubit, List<Notlar>>(
        builder: (context, notlarListesi) {
          if (notlarListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: notlarListesi.length,
              itemBuilder: (context, index) {
                var not = notlarListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetaySayfa(not: not)))
                        .then((value) {
                      context.read<AnasayfaCubit>().notlarYazdir();
                    });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          not.id.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*
                              Text(
                                not.id.toString(),
                                style: TextStyle(fontSize: 20),
                              ),

                               */
                              Text(
                                not.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(not.icerik),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("${not.name} silinsin mi ?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: () {
                                    context.read<AnasayfaCubit>().sil(not.id);
                                  },
                                ),
                              ));
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black54,
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            context.read<AnasayfaCubit>().notlarYazdir();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
