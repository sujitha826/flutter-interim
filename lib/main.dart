import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interim_task/bloc/item_details_bloc.dart';
import 'package:flutter_interim_task/screens/cart_screen.dart';
import 'package:flutter_interim_task/screens/item_screen.dart';
import 'package:flutter_interim_task/appConstants/constants.dart';

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
      // home: BlocProvider<ItemDetailsBloc>(
      //   create: (context) => ItemDetailsBloc(),
      //   child: const CartScreen(),
      // ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            title: Text(AppConstants.cart),
            leading: const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Active',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Past Order',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue, // Color of the underline when selected
                    width: 3.0, // Thickness of the underline
                  ),
                ),
              ),
              labelColor: Colors.blue,
            ),
          ),
          body: TabBarView(
            children: [
              BlocProvider<ItemDetailsBloc>(
                create: (context) => ItemDetailsBloc(),
                child: const CartScreen(),
              ),
              const Center(
                child: Text('Past Order screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
