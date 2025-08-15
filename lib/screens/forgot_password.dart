import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:blood_bank/widget/my_report_problem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_bank/widget/my_text_inside_container.dart';

@RoutePage()
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle style2 = TextStyle(
      color: backgroundColor,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: primaryColor,
        ),
        actions: myReportProblem(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: ListView(
          children: [
            MyTextField(
              hintText: 'ادخل البريد الالكتروني',
              isPassword: false,
              icon: Icons.email,
              controller: email,
              inputType: InputType.email,
            ),
            SizedBox(height: 15.h),
            MyTextInsideContainer(
              title: 'ارسال الرمز',
              containerWidth: 150,
              textStyle: style2,
              onPressed: () {},
              containerColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
