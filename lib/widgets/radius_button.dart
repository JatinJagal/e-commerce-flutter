import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RadiusButton extends StatelessWidget {
  final Color? bgColor;
  final Color? textColor;
  final Widget? text;
  final Color borderColor;
  final IconData? icon;
  final VoidCallback? onPress;
  final Color? iconColor;
  final double? height;
  final double? width;
  const RadiusButton(
      {this.bgColor,
      this.height,
      this.width,
      this.iconColor,
      this.textColor,
      this.onPress,
      this.icon,
      this.text,
      required this.borderColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(10),
          width: width, //infinity
          height: height, //0.06
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(width: 1, color: borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              text!
            ],
          )),
    );
  }
}

// Text(
//                 text!,
//                 style: TextStyle(
//                     color: textColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ).tr()