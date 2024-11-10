import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key, required this.color, required this.thickness, this.width});
  final Color color;
  final double thickness;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(
        thickness: thickness,
        color: color,
      ),
    );
  }
}
