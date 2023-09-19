import 'package:flutter/material.dart';
import 'package:flutter_interim_task/appConstants/constants.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.statusUpdate});

  final String statusUpdate;

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.done;
    Color colorOfIcon = Colors.blue;
    if (statusUpdate == AppConstants.deliver) {
      icon = Icons.adjust;
      colorOfIcon = Colors.grey;
    }
    return Visibility(
      visible: true,
      child: Row(
        children: [
          statusTickIcon(icon, colorOfIcon),
          Text(
            statusUpdate,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

Widget statusTickIcon(IconData img, Color col) {
  return Padding(
    padding: const EdgeInsets.only(left: 22, top: 10, right: 10),
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        img,
        color: Colors.white,
      ),
    ),
  );
}
