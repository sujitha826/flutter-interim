import 'package:flutter/material.dart';

class StepVerticalLine extends StatefulWidget {
  const StepVerticalLine({super.key, required this.step});

  final int step;

  @override
  State<StepVerticalLine> createState() => _StepVerticalLineState();
}

class _StepVerticalLineState extends State<StepVerticalLine>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<int> stepNumbers = [1, 2, 3, 4];
  final List<Color> stepColors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [stepVerticalLine(widget.step)],
    );
  }

  Widget stepVerticalLine(int step) {
    final Color col = stepColors[step - 1];
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: AnimatedBuilder(
        animation: _animationController,
        child: SizedBox(
          height: 30,
          child: VerticalDivider(
            color: col,
            thickness: 2,
            width: 2,
          ),
        ),
        builder: (context, child) {
          final interval = 1.0 / stepNumbers.length;
          final animationValue =
              (step - 1) * interval + _animationController.value * interval;
          final double scale = Tween<double>(begin: 0, end: 1.5)
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(animationValue, (step * interval)),
                ),
              )
              .value;
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
      ),
    );
  }
}
