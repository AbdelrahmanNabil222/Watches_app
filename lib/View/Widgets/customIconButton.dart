import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onPressed,
      required this.icon,
      this.backgroundColor,
      this.padding,
      this.shape,
      this.iconSize});
  final void Function()? onPressed;
  final Widget icon;
  final MaterialStateProperty<Color?>? backgroundColor;
  final double? iconSize;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: iconSize,
      icon: icon,
      style: ButtonStyle(
          backgroundColor: backgroundColor, padding: padding, shape: shape),
    );
  }
}
