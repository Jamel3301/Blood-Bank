import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class Opining extends StatelessWidget {
  const Opining({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        actions: [
          Spacer(),
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              context.router.push(ReportProblem());
            },
            child: Text('الإبلاغ عن مشكلة', style: style),
          ),
          Icon(Icons.phone, color: primaryColor),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250.h,
            width: 250.w,
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          MyIconButton(
            title: 'تسجيل الدخول',
            onPressed: () {
              context.router.push(Signin());
            },
            primaryColor: primaryColor,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          MyIconButton(
            title: 'إنشاء حساب',
            onPressed: () {
              context.router.push(Signup());
            },
            primaryColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
