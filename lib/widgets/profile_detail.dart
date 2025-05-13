import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String? title;
  final String? text;
  const ProfileDetail({this.title, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "   ${text!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 200,
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            )
          ],
        )
      ],
    );
  }
}
