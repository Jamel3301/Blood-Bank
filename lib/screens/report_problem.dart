import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ReportProblem extends StatelessWidget {
  const ReportProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'سيتم توفير هذة الخدمة في اقرب وقت',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
      ),
    );
  }
}
