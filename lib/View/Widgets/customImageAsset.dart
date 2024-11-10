import 'package:flutter/material.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset(
      {super.key,
      required this.image,
      this.fit,
      this.height,
      this.width,
      this.color});
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      height: height,
      width: width,
      color: color,
    );
  }
}
