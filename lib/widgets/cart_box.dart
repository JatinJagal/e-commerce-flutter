import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/widgets/item_count_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBox extends StatelessWidget {
  final String? price;
  final String? image;
  final String? title;
  final VoidCallback? removeItem;
  const CartBox(
      {this.price, this.image, this.title, this.removeItem, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: height * 0.20,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            height: height * 0.14,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(image!))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // Consumer<CartProvider>(
                    //   builder: (context, value, child) {
                    //     return ItemCountButton(
                    //       cartIndex: value.cartItem.toString(),
                    //       increment: () {
                    //         value.increaseCartItem();
                    //       },
                    //       decrease: () {
                    //         value.decreaseCartItem();
                    //       },
                    //       bgColor: Colors.grey.shade200,
                    //     );
                    //   },
                    // ),
                    IconButton(
                        onPressed: removeItem,
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
          Text(
            title!,
            maxLines: 1,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Vado Odelle Dress"),
              Text(
                price!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
