import 'package:e_commerce/constants/images.dart';
import 'package:flutter/material.dart';

class ProductArrivalCard extends StatelessWidget {
  final Widget? button;
  final String? title;
  final String? description;
  final String? image;
  final String? price;
  const ProductArrivalCard(
      {this.button,
      this.title,
      this.description,
      this.image,
      this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: height * 0.01),
        height: height * 0.12,
        width: width * 0.85,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 10, offset: Offset(6, 12))
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
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.026,
                    width: width * 0.42,
                    child: Text(
                      title!,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    description!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    // ,
                    price!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            button!
          ],
        ),
      ),
    );
  }
}
