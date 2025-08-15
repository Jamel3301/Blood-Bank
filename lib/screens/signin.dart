import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_report_problem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_bank/widget/my_text_inside_container.dart';

@RoutePage()
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController typeSignin = TextEditingController();
  TextEditingController password = TextEditingController();
  // String _checkType = 'email';
  // String hintText = 'ادخل البريد الالكتروني';
  // IconData icon = Icons.email;
  // checkType() {
  //   if (_checkType == 'email') {
  //     hintText = 'ادخل البريد الالكتروني';
  //     icon = Icons.email;
  //   } else {
  //     hintText = 'ادخل رقم الهاتف';
  //     icon = Icons.phone;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle buttonStyle = TextStyle(
      color: backgroundColor,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    );
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     MyTextInsideContainer(
            //       title: 'البريد الالكتروني',
            //       textStyle: buttonStyle,
            //       onPressed: () {
            //         setState(() {
            //           _checkType = 'email';
            //           checkType();
            //         });
            //       },
            //       containerWidth: 110.w,
            //       containerColor: primaryColor,
            //     ),
            //     MyTextInsideContainer(
            //       title: 'رقم الهاتف',
            //       textStyle: buttonStyle,
            //       onPressed: () {
            //         setState(() {
            //           _checkType = 'phoneNumber';
            //           checkType();
            //         });
            //       },
            //       containerWidth: 110.w,
            //       containerColor: primaryColor,
            //     ),
            //   ],
            // ),
            // SizedBox(height: 15.h),
            MyTextField(
              hintText: 'ادخل البريد الالكتروني',
              isPassword: false,
              icon: Icons.email,
              controller: typeSignin,
            ),
            SizedBox(height: 15.h),
            MyTextField(
              hintText: 'ادخل الرمز السري',
              isPassword: false,
              icon: Icons.password,
              controller: password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    context.router.push(ForgotPassword());
                  },
                  child: Text('!نسيت كلمة المرور', style: style),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            MyTextInsideContainer(
              title: 'تسجيل الدخول',
              containerWidth: 150.w,
              textStyle: buttonStyle,
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: typeSignin.text,
                        password: password.text,
                      );
                  // if (credential.user!.emailVerified) {
                  context.router.replace(RequestList());
                  // }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('=============================');
                    print('No user found for that email.');
                    print('=============================');
                  } else if (e.code == 'wrong-password') {
                    print('======================================');
                    print('Wrong password provided for that user.');
                    print('======================================');
                  }
                } catch (e) {
                  print('==========================================');
                  print(e);
                  print('==========================================');
                }
              },
              containerColor: primaryColor,
            ),
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
