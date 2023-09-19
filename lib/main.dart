import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interim_task/bloc/item_details_bloc.dart';
import 'package:flutter_interim_task/screens/cart_screen.dart';
import 'package:flutter_interim_task/screens/item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Interim Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(5, 255, 255, 255)),
        useMaterial3: true,
      ),
      routes: {
        ItemScreen.route: (ctx) => const ItemScreen(),
      },
      home: BlocProvider<ItemDetailsBloc>(
        create: (context) => ItemDetailsBloc(),
        child: const CartScreen(),
      ),
    );
  }
}
