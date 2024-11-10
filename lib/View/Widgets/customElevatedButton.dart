import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.fontSize,
    this.textcolor,
    this.onPressed,
    this.backgroundColor,
    this.shape,
    this.side,
    this.padding,
  });
  final String text;
  final double? fontSize;
  final Color? textcolor;
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final MaterialStateProperty<BorderSide?>? side;

  final void Function()? onPressed;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              fontSize: fontSize,
              color: textcolor,
            )),
        style: ButtonStyle(
            backgroundColor: backgroundColor,
            shape: shape,
            padding: padding,
            side: side));
  }
}
