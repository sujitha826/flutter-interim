import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interim_task/appConstants/constants.dart';
import 'package:flutter_interim_task/bloc/item_details_bloc.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});
  static String route = '/item-details';

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
    // starting the animator
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppConstants.selectedItem),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Icon(
                Icons.favorite_border_outlined,
              ),
            )
          ],
        ),
        body: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
          builder: (context, state) {
            if (state is ItemDetailsFinal) {
              return Card(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageBox(
                        280,
                        280,
                        Image.asset(state.itemDetails['itemImage']!),
                      ),
                      sizedBoxWithGivenHeight(10),
                      textDisplay(state.itemDetails['itemRate']!, 19,
                          FontWeight.bold, Colors.black),
                      sizedBoxWithGivenHeight(18),
                      textDisplay(state.itemDetails['itemDetail']!, 15,
                          FontWeight.normal, Colors.black),
                      imageBox(
                        50,
                        100,
                        Image.asset(state.itemDetails['ratingStars']!),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 30,
                          width: 80,
                          color: const Color.fromARGB(99, 239, 255, 65),
                          child: Center(
                            child: textDisplay(
                                state.itemDetails['itemRatingValue']!,
                                14,
                                FontWeight.bold,
                                Colors.orange),
                          ),
                        ),
                      ),
                      sizedBoxWithGivenHeight(22),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: textDisplay(AppConstants.buyNowButton, 15,
                              FontWeight.bold, Colors.white),
                        ),
                      ),
                      sizedBoxWithGivenHeight(22),
                      textDisplay(
                        AppConstants.addToCart,
                        17,
                        FontWeight.bold,
                        Colors.blue,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  AppConstants.detailsNotAvailable,
                  style: const TextStyle(color: Colors.red, fontSize: 15),
                ),
              );
            }
          },
        ),
      ),
      builder: (context, child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(0,
                0.4), // x-axis offset - 0, y-axis offset - 30% down along y-axis
            end: const Offset(0, 0),
          ),
        ),
        child: child,
      ),
    );
  }
}

Widget textDisplay(String text, double size, FontWeight weight, Color col) {
  return Text(text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: col));
}

Widget imageBox(double height, double width, Image image) {
  return SizedBox(height: height, width: width, child: image);
}

Widget sizedBoxWithGivenHeight(double heightValue) {
  return SizedBox(
    height: heightValue,
  );
}
