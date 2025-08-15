import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_bank/widget/my_text_inside_container.dart';

@RoutePage()
class BloodBank extends StatelessWidget {
  const BloodBank({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          SizedBox(height: 250.h, child: Image.asset('assets/images/logo.png')),
          SizedBox(height: 200.h),
          MyTextInsideContainer(
            title: 'تسجيل الدخول',
            onPressed: () {
              context.router.push(Signin());
            },
            containerColor: primaryColor,
          ),
          SizedBox(height: 5.h),
          MyTextInsideContainer(
            title: 'إنشاء حساب',
            onPressed: () {
              context.router.push(Signup());
            },
            containerColor: primaryColor,
          ),
          SizedBox(height: 5.h),
          MyTextInsideContainer(
            title: 'الشاشة الرئيسية',
            onPressed: () {
              context.router.push(RequestList());
            },
            containerColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
