// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_icon_button.dart';
import 'package:blood_bank/widget/my_dropdown_button.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> items = ['الموصل']; // المحافظات
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color backgroundColor = Color(0xFFFFFFFF);
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    );
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              spacing: 15.h,
              children: [
                SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset('assets/images/logo.png'),
                ),
                MyTextField(
                  hintText: 'ادخل اسم المستخدم',
                  isPassword: false,
                  icon: Icons.person,
                  controller: userName,
                  inputType: InputType.text,
                ),
                MyTextField(
                  hintText: 'ادخل رقم الهاتف',
                  isPassword: false,
                  icon: Icons.phone,
                  controller: phoneNumber,
                  inputType: InputType.phoneNumber,
                ),
                MyTextField(
                  hintText: 'ادخل البريد الالكتروني',
                  isPassword: false,
                  icon: Icons.email,
                  controller: email,
                  inputType: InputType.email,
                ),
                MyTextField(
                  hintText: 'ادخل الرمز السري',
                  isPassword: true,
                  icon: Icons.password,
                  controller: password,
                ),
                MyDropdownButton(
                  hint: 'اختر محافظة',
                  items: items,
                  icon: Icons.place_outlined,
                ),
                MyIconButton(
                  title: 'انشاء الحساب',
                  width: 150.w,
                  style: style2,
                  onPressed: () async {
                    try {
                      // final credential =
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  primaryColor: primaryColor,
                ),
                MyIconButton(
                  title: 'تسجيل خروج',
                  width: 150,
                  style: style2,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  primaryColor: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
