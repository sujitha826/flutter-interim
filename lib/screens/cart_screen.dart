import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interim_task/appConstants/constants.dart';
import 'package:flutter_interim_task/screens/item_screen.dart';
import 'package:flutter_interim_task/widgets/card_widget.dart';
import 'package:flutter_interim_task/widgets/status_widget.dart';
import 'package:flutter_interim_task/bloc/item_details_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ValueNotifier<int> orderProgress = ValueNotifier<int>(0);
  // Function to update order progress
  void updateOrderProgress(int step) {
    orderProgress.value = step;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: const Text('Cart'),
        leading: const Icon(
          Icons.arrow_back,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              padding: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   border: Border.all(width: 0.1),
              // ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 22,
                      bottom: 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed(ItemScreen.route);
                        BlocProvider.of<ItemDetailsBloc>(context)
                            .add(GetItemDetailsEvent(itemId: 381478));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(
                              providers: [
                                BlocProvider.value(
                                  value:
                                      BlocProvider.of<ItemDetailsBloc>(context),
                                ),
                              ],
                              child: const ItemScreen(),
                            ),
                          ),
                        );
                      },
                      child: const CardWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 22,
                      bottom: 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ItemScreen.route);
                      },
                      child: const CardWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 22,
                      left: 22,
                      bottom: 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ItemScreen.route);
                      },
                      child: const CardWidget(),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                bottom: 20,
              ),
              child: Text(
                AppConstants.statusHeading,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StatusWidget(statusUpdate: AppConstants.orderPlaced),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const SizedBox(
                height: 25,
              ),
            ),
            StatusWidget(statusUpdate: AppConstants.payment),
            const SizedBox(
              height: 25,
            ),
            StatusWidget(statusUpdate: AppConstants.processing),
            const SizedBox(
              height: 25,
            ),
            StatusWidget(statusUpdate: AppConstants.onTheWay),
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 55,
                  top: 10,
                  bottom: 10,
                  right: 10,
                ),
                child: Text(
                  AppConstants.pickUpStatus,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            StatusWidget(statusUpdate: AppConstants.deliver),
          ],
        ),
      ),
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => MultiBlocProvider(
//       providers: [
//         BlocProvider.value(
//           value: BlocProvider.of<ItemDetailsBloc>(context),
//         ),
//       ],
//       child: const ItemScreen(),
//     ),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
