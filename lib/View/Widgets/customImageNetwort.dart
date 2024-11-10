import 'package:flutter/material.dart';

class CustomImegeNetwork extends StatelessWidget {
  const CustomImegeNetwork(
      {super.key, required this.image, this.height, this.width, this.fit});
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
