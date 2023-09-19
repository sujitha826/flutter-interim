import 'package:flutter/material.dart';
import 'package:flutter_interim_task/appConstants/constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Color of the shadow
            spreadRadius: 2, // Spread radius
            blurRadius: 2, // Blur radius
            offset: const Offset(0, 2), // Offset of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CardDisplay(
                  text: AppConstants.orderNoText +
                      AppConstants.orderNo.toString(),
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 45,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                  ),
                )
              ],
            ),
            // CardDisplay(
            //   text: AppConstants.placedDate,
            //   size: 12,
            //   weight: FontWeight.normal,
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 5,
              ),
              child: Text(
                AppConstants.placedDate,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            CardDisplay(
              text: AppConstants.paid,
              size: 15,
              weight: FontWeight.bold,
            ),
            CardDisplay(
              text: AppConstants.statusOnTheWay,
              size: 15,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class CardDisplay extends StatelessWidget {
  const CardDisplay(
      {super.key,
      required this.text,
      required this.size,
      required this.weight});

  final String text;
  final double size;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}
