import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? price;
  const FavouriteCard({this.image, this.title, this.price, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      height: height * 0.11,
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 20, offset: Offset(-10, 8))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height * 0.08,
            width: width * 0.18,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image!), fit: BoxFit.fill),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: height * 0.02,
                width: width * 0.4,
                child: Text(
                  title!,
                  maxLines: 1,
                  style: const TextStyle(),
                ),
              ),
              Text(
                price!,
              ),
            ],
          ),

          Consumer<CartProvider>(
            builder: (context, value, child) {
              return IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined));
            },
          )
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: RadiusButton(
          //     borderColor: Colors.black,
          //     height: height * 0.04,
          //     width: width * 0.4,
          //     text: const Text(
          //       "Add to cart",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     bgColor: Colors.black,
          //     icon: Icons.shopping_bag_outlined,
          //     iconColor: Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}
