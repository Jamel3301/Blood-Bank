import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      'الإبلاغ عن مشكلة',
                      style: TextStyle(
                        color: Color(0xFFE1393A),
                        fontWeight: FontWeight.w600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 23,
                    width: 23,
                    child: ImageIcon(
                      AssetImage('assets/images/phone.png'),
                      color: Color(0xFFE1393A),
                      size: 23,
                    ),
                  ),
                ],
              ),
              Expanded(child: Image.asset('assets/images/logo.png')),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 15,
                  children: [
                    Button(title: 'تسجيل الدخول', onPressed: () {}),
                    Button(title: 'إنشاء حساب', onPressed: () {}),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.onPressed});
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed(),
      icon: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE1393A),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
