import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // final VoidCallback? onpress;
  final String? title;
  final String? image;
  final String? description;
  final String? price;
  const ProductCard(
      {
      // this.onpress,
      this.price,
      this.description,
      this.image,
      this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: Colors.amber,
      // height: height * 0.34, //34
      // width: width * 0.44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* Container(
            // height: height * 0.24,
            // width: width * 0.44,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth, image: NetworkImage(image!),),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
          ),*/
          Image.network(
            image!,
            height: height * 0.24,
            width: width * 0.44,
          ),
          Text(
            textAlign: TextAlign.center,
            title!, //"Madewale"
            style:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), //16
          ),
          Text(
            maxLines: 2,
            description!,
            style: const TextStyle(
              fontSize: 12,
            ),
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
