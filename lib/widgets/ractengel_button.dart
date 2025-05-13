import 'package:flutter/material.dart';

class RactengleButton extends StatelessWidget {
  final Color? bgColor;
  final String? icon;
  const RactengleButton({this.bgColor, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.05,
      width: width * 0.11,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: Image.asset(icon!, height: height * 0.02),
      ),
    );
  }
}
