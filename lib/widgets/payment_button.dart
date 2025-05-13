import 'package:e_commerce/constants/images.dart';
import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final String? icon;
  final String? label;
  final Color? bgColor;
  final Color? borderColor;
  const PaymentButton(
      {this.icon, this.label, this.bgColor, this.borderColor, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14),
      margin: const EdgeInsets.only(bottom: 14.0),
      height: height * 0.068,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: bgColor!,
          boxShadow: const [
            BoxShadow(
                blurRadius: 20, color: Colors.grey, offset: Offset(10, 10))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  height: height * 0.05,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(icon!),
                  )),
              SizedBox(width: width * 0.02),
              Text(
                label!,
                style: TextStyle(color: borderColor!),
              )
            ],
          ),
          Container(
            height: height * 0.02,
            width: width * 0.04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1, color: borderColor!)),
          )
        ],
      ),
    );
  }
}
