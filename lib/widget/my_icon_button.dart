import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.primaryColor,
    this.width = double.infinity,
    this.style = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  });
  final String title;
  final Function() onPressed;
  final Color primaryColor;
  final double width;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 45.h,
        width: width.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(child: Text(title, style: style)),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
