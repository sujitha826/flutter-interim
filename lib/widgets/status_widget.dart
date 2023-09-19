import 'package:flutter/material.dart';
// import 'package:flutter_interim_task/appConstants/constants.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget(
      {super.key, required this.statusUpdate, required this.step});

  final String statusUpdate;
  final int step;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isVisible = true;

  final List<int> stepNumbers = [1, 2, 3, 4, 5];
  final List<Color> stepColors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // IconData icon = Icons.done;
    // Color colorOfIcon = Colors.blue;
    // if (widget.statusUpdate == AppConstants.deliver) {
      // icon = Icons.adjust;
      // colorOfIcon = Colors.grey;
    // }
    return Visibility(
      visible: isVisible,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // statusTickIcon(icon, colorOfIcon),
          statusNumberIcon(widget.step),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.statusUpdate,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget statusNumberIcon(int step) {
    final Color col = stepColors[step - 1];

    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 0, right: 10),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final interval = 1.0 / stepNumbers.length;
          final animationValue =
              (step - 1) * interval + _controller.value * interval;
          final double scale = Tween<double>(begin: 0, end: 1.5)
              .animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(animationValue, (step * interval)),
                ),
              )
              .value;
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: buildStepCircle(step, col),
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

Widget buildStepCircle(int step, Color col) {
  return Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: col,
      borderRadius: BorderRadius.circular(15),
    ),
    child: buildStepText(step),
  );
}

Widget buildStepText(int step) {
  return Center(
    child: Text(
      step.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );
}
