import 'package:employee_direct/dashboard/dashboard.dart';
import 'package:employee_direct/employe_direct/employe_direct.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final pages = [
    const DashBoard(),
    const EmployeDirect(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Color(0xff7390c4),
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Color(0xffafb0ba),
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.settings,
                    color: Color(0xff7390c4),
                    size: 35,
                  )
                : const Icon(
                    Icons.settings_outlined,
                    color: Color(0xffafb0ba),
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
