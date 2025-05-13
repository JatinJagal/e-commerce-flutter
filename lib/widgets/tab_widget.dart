import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String? label;
  final double? radius;
  const TabWidget({this.label, this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Tab(
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius!)), //24
            border: Border.all(color: Colors.black, width: 1)),
        child: Center(child: Text(label!)),
      ),
    );
  }
}
