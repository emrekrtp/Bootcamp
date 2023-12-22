import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/ui/cubit/detail_page_cubit.dart';
import 'package:to_do_application/ui/cubit/home_page_cubit.dart';
import 'package:to_do_application/ui/cubit/register_page_cubit.dart';
import 'package:to_do_application/ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => KayitSayfaCubit()),
        BlocProvider(create: (context) => DetaySayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.greenAccent, onPrimary: Colors.blue),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
