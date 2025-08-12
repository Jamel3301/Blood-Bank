// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_icon_button.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController typeSignin = TextEditingController();
  TextEditingController password = TextEditingController();
  String _checkType = 'email';
  String hintText = 'ادخل البريد الالكتروني';
  IconData icon = Icons.email;
  checkType() {
    if (_checkType == 'email') {
      hintText = 'ادخل البريد الالكتروني';
      icon = Icons.email;
    } else {
      hintText = 'ادخل رقم الهاتف';
      icon = Icons.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle buttonStyle = TextStyle(
      color: backgroundColor,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    );
    TextStyle textFailedStyle = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
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
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyIconButton(
                      title: 'البريد الالكتروني',
                      style: buttonStyle,
                      onPressed: () {
                        setState(() {
                          _checkType = 'email';
                          checkType();
                        });
                      },
                      width: 120.w,
                      primaryColor: primaryColor,
                    ),
                    MyIconButton(
                      title: 'رقم الهاتف',
                      style: buttonStyle,
                      onPressed: () {
                        setState(() {
                          _checkType = 'phoneNumber';
                          checkType();
                        });
                      },
                      width: 120.w,
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                MyTextField(
                  hintText: hintText,
                  isPassword: false,
                  icon: icon,
                  controller: typeSignin,
                ),
                SizedBox(height: 10.h),
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
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        context.router.push(ForgotPassword());
                      },
                      child: Text('!نسيت كلمة المرور', style: textFailedStyle),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                MyIconButton(
                  title: 'تسجيل الدخول',
                  width: 150.w,
                  style: buttonStyle,
                  onPressed: () async {
                    try {
                      // final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: typeSignin.text,
                        password: password.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  primaryColor: primaryColor,
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
                    Text('  أو  ', style: textFailedStyle),
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
        ],
      ),
    );
  }
}
