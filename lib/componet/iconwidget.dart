import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);
  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Icon(
            icon,
            size: 80,
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          child: Text(text!),
        )
      ],
    );
  }
}