import 'package:flutter/material.dart';

class CirlceButton extends StatelessWidget {
  final String? icon;
  final VoidCallback? onpress;
  final Color? bgColor;
  const CirlceButton({this.icon, this.onpress, this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onpress,
      child: SizedBox(
        height: height * 0.16,
        width: width * 0.16,
        child: CircleAvatar(
          backgroundColor: bgColor,
          child: Center(
            child: Image.asset(
              icon!,
              height: height * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
