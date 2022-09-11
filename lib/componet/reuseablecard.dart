import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    Key? key,
    required this.color,
    required this.radius,  this.child, this.onPressed,
  }) : super(key: key);

  final Color color;
  final double radius;
  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(radius)),
            child: child,
          ),
        ),
      ),
    );
  }
}
