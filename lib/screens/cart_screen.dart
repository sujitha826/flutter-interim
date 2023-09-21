import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interim_task/appConstants/constants.dart';
import 'package:flutter_interim_task/screens/item_screen.dart';
import 'package:flutter_interim_task/widgets/card_widget.dart';
import 'package:flutter_interim_task/widgets/status_widget.dart';
import 'package:flutter_interim_task/bloc/item_details_bloc.dart';
import 'package:flutter_interim_task/widgets/step_line_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<ItemDetailsBloc>(context).add(TrackingSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.onSecondary,
      //   title: Text(AppConstants.cart),
      //   leading: const Icon(
      //     Icons.arrow_back,
      //   ),
      // ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            padding: const EdgeInsets.all(10),
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
          BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
              buildWhen: (previous, current) {
            return current is TrackingSuccessState;
          }, builder: (context, state) {
            // if (state is TrackingSuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusWidget(statusUpdate: AppConstants.orderPlaced, step: 1),
                sizedBoxHeight10(),
                // stepVerticalLine(1),
                const StepVerticalLine(step: 1),
                StatusWidget(statusUpdate: AppConstants.payment, step: 2),
                sizedBoxHeight10(),
                // stepVerticalLine(1),
                const StepVerticalLine(step: 2),
                StatusWidget(statusUpdate: AppConstants.processing, step: 3),
                sizedBoxHeight10(),
                // stepVerticalLine(1),
                const StepVerticalLine(step: 3),
                StatusWidget(statusUpdate: AppConstants.onTheWay, step: 4),
                sizedBoxHeight10(),
                Row(
                  children: [
                    const StepVerticalLine(step: 4),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            bottom: 10,
                            right: 20,
                          ),
                          child: Text(
                            AppConstants.pickUpStatus,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              // fontFamily:
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StatusWidget(statusUpdate: AppConstants.deliver, step: 5),
              ],
            );
          }
              // else {
              //   return Padding(
              //     padding: const EdgeInsets.all(15),
              //     child: Center(
              //       child: Text(
              //         AppConstants.msg,
              //         style: const TextStyle(
              //           color: Colors.red,
              //           fontSize: 15,
              //         ),
              //       ),
              //     ),
              //   );
              // }

              )
        ],
      ),
    );
  }
}

Widget sizedBoxHeight10() {
  return const SizedBox(
    height: 10,
  );
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
