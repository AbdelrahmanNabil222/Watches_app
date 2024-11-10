import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.height,
      this.width,
      this.child,
      required this.backgroundColor,
      this.borderRadius});
  final double? height;
  final double? width;
  final Widget? child;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        decoration:
            BoxDecoration(borderRadius: borderRadius, color: backgroundColor),
        child: child);
  }
}
