import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_report_problem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_bank/widget/my_text_inside_container.dart';

@RoutePage()
class FirstSignup extends StatefulWidget {
  const FirstSignup({super.key});

  @override
  State<FirstSignup> createState() => _FirstSignupState();
}

class _FirstSignupState extends State<FirstSignup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle style2 = TextStyle(
      color: backgroundColor,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    );
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: 150.h,
              child: Image.asset('assets/images/logo.png'),
            ),
            MyTextField(
              hintText: 'ادخل البريد الالكتروني',
              isPassword: false,
              icon: Icons.email,
              controller: email,
              inputType: InputType.email,
            ),
            SizedBox(height: 15.h),
            MyTextField(
              hintText: 'ادخل الرمز السري',
              isPassword: true,
              icon: Icons.password,
              controller: password,
            ),
            SizedBox(height: 15.h),
            MyTextInsideContainer(
              title: 'انشاء الحساب',
              containerWidth: 150.w,
              textStyle: style2,
              containerColor: primaryColor,
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  context.router.replace(SecondSignup());
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('==================================');
                    print('The password provided is too weak.');
                    print('==================================');
                  } else if (e.code == 'email-already-in-use') {
                    print('==========================================');
                    print('The account already exists for that email.');
                    print('==========================================');
                  }
                } catch (e) {
                  print('==========================================');
                  print(e);
                  print('==========================================');
                }
              },
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                ),
                Text('  أو  ', style: style),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(
              height: 45.h,
              width: 150.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/apple.png',
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 40.w),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
