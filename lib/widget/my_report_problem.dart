import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> myReportProblem(BuildContext context) {
  Color primaryColor = Color(0xFFE1393A);
  TextStyle style = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  return [
    Spacer(),
    TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsetsGeometry.zero),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        context.router.push(ReportProblem());
      },
      child: Text('الإبلاغ عن مشكلة', style: style),
    ),
    Icon(Icons.phone, color: primaryColor),
    SizedBox(width: 8.w),
  ];
}
