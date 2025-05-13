import 'package:flutter/material.dart';

class CustomInfoRow extends StatelessWidget {
  final String? title;
  final String? data;
  const CustomInfoRow({this.title, this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(data!)
      ],
    );
  }
}
