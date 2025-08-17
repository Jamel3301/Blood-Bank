import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_bank/widget/my_text_field.dart';
import 'package:blood_bank/router/app_router.gr.dart';
import 'package:blood_bank/widget/my_report_problem.dart';
// import 'package:blood_bank/widget/my_dropdown_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_bank/widget/my_text_inside_container.dart';

@RoutePage()
class SecondSignup extends StatefulWidget {
  const SecondSignup({super.key});

  @override
  State<SecondSignup> createState() => _SecondSignupState();
}

class _SecondSignupState extends State<SecondSignup> {
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  List<String> items = ['الموصل'];
  String? selectedValue;

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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: 150.h,
              child: Image.asset('assets/images/logo.png'),
            ),
            MyTextField(
              hintText: 'ادخل اسم المستخدم',
              isPassword: false,
              icon: Icons.person,
              controller: userName,
              inputType: InputType.text,
            ),
            SizedBox(height: 15.h),
            MyTextField(
              hintText: 'ادخل رقم الهاتف',
              isPassword: false,
              icon: Icons.phone,
              controller: phoneNumber,
              inputType: InputType.phoneNumber,
            ),
            SizedBox(height: 15.h),
            // MyDropdownButton(
            //   hint: 'اختر محافظة',
            //   items: items,
            //   icon: Icons.place_outlined,
            // ),
            // SizedBox(height: 15.h),
            MyTextInsideContainer(
              title: 'انشاء الحساب',
              containerWidth: 150.w,
              textStyle: style2,
              containerColor: primaryColor,
              onPressed: () {
                CollectionReference collRef = FirebaseFirestore.instance
                    .collection('client');
                collRef.add({
                  'user name': userName.text,
                  'phone number': phoneNumber.text,
                });
                context.router.replace(Signin());
              },
            ),
          ],
        ),
      ),
    );
  }
}
