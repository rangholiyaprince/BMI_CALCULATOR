import 'package:flutter/material.dart';

class RawButton extends StatelessWidget {
  const RawButton({
    Key? key,
     this.icon,
     this.onpressed,
     this.color,
  }) : super(key: key);
  final IconData? icon;
  final Function()? onpressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 8,
      shape: const CircleBorder(),
      fillColor: color,
       constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
