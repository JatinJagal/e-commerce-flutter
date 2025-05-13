import 'package:flutter/material.dart';

class SizeCircle extends StatelessWidget {
  const SizeCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(4.0),
      height: height * 0.05,
      width: width * 0.11,
      child: Center(
        child: Text("M"),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(40)),
    );
  }
}
