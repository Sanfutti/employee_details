import 'package:flutter/material.dart';

class EmployeDirect extends StatefulWidget {
  const EmployeDirect({Key? key}) : super(key: key);

  @override
  State<EmployeDirect> createState() => _EmployeDirectState();
}

class _EmployeDirectState extends State<EmployeDirect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xffccdce9),
            Color(0xfff5f9fc),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Center(
        child: Text('Employee direct'),
      ),
    );
  }
}
