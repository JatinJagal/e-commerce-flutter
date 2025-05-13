import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/images.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      padding: const EdgeInsets.all(10.0),
      height: height * 0.14,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 40, offset: Offset(6, 12))
          ],
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height * 0.09,
            width: width * 0.20,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(shoesImg), fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Alex Arigato",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Clean 90 triple Sneakers",
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                "Quality: 1",
                style: TextStyle(fontSize: 14),
              ),
              Row(
                children: [
                  const Text("Color: "),
                  SizedBox(
                    height: height * 0.02,
                    width: width * 0.04,
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
          Text(
            "\$245.00",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
