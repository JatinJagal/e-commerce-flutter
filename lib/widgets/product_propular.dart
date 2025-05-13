import 'package:flutter/material.dart';

import '../constants/images.dart';

class PopularProduct extends StatelessWidget {
  final String? image;
  final String? title;
  final String? price;
  const PopularProduct({this.title, this.image, this.price, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      height: height * 0.12,
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image!), fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.03,
                width: width * 0.42,
                child: Text(
                  title!, //
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "RHW Rosie | Sandals",
                style: TextStyle(fontSize: 14),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Text(
                    "(4.5)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          Text(
            "\$${price!}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
