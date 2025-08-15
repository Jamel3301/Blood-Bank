import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextInsideContainer extends StatelessWidget {
  const MyTextInsideContainer({
    super.key,
    required this.title,
    required this.onPressed,
    required this.containerColor,
    this.containerWidth = double.infinity,
    this.containerHeight = 45,
    this.textStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  });
  final String title;
  final Function() onPressed;
  final Color containerColor;
  final double containerWidth;
  final TextStyle textStyle;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: containerHeight.h,
        width: containerWidth.w,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(child: Text(title, style: textStyle)),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
