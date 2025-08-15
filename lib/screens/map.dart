import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_bank/router/app_router.gr.dart';

@RoutePage()
class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [Text('data')]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.view_list_outlined),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.red[50],
                  highlightColor: Colors.red[50],
                  onPressed: () {
                    context.router.push(RequestList());
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.map),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.person_outline),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.red[50],
                  highlightColor: Colors.red[50],
                  onPressed: () {
                    context.router.push(Profile());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
