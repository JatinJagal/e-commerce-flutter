import 'dart:async';

import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/order_screen/orders_screen.dart';
import 'package:e_commerce/widgets/cart_circle_button.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:e_commerce/widgets/size_circle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDataModel productData;

  const ProductDetailScreen({required this.productData, super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int counter = 0;

  double total = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: -30,
              child: Container(
                width: double.infinity,
                height: height * 0.52,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${widget.productData.image}"),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
                top: height * 0.03, //20
                left: height * 0.03, //20
                right: height * 0.03, //20
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CirlceButton(
                            icon: arrowBack,
                            bgColor: Colors.black,
                            onpress: () {
                              Navigator.pop(context);
                            }),
                        Consumer<CartProvider>(
                          builder: (context, value, child) {
                            return InkWell(
                                onTap: () {},
                                child: CartCircleButton(
                                  onPress: () {
                                    Timer(const Duration(seconds: 2), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrdersScreen(
                                                    productData:
                                                        widget.productData,
                                                  )));
                                    });
                                  },
                                ));
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(""),
                        Consumer<CartProvider>(
                          builder: (context, value, child) {
                            return IconButton(
                                onPressed: () {
                                  if (value.favouriteItemList!
                                      .contains(widget.productData)) {
                                    value.removeFromFavourite(
                                        widget.productData);
                                  } else {
                                    value.addToFavourite(widget.productData);
                                  }
                                },
                                icon: value.favouriteItemList!
                                        .contains(widget.productData)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.red,
                                      ));
                          },
                        )
                      ],
                    )
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                top: height * 0.46,
                child: Container(
                  height: height * 0.50,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.productData.title}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.001,
                                  ),
                                  const Text(
                                    "Giselle Top in White Linen",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: height * 0.05,
                            //   width: height * 0.14,
                            //   child: Consumer<CartProvider>(
                            //     builder: (context, value, child) {
                            //       return ItemCountButton(
                            //         cartIndex: value.cartItem.toString(),
                            //         increment: () {
                            //           value.increaseCartItem();
                            //         },
                            //         decrease: () {
                            //           value.decreaseCartItem();
                            //         },
                            //         bgColor: Colors.grey.shade200,
                            //       );
                            //     },
                            //   ),
                            // )
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                    var price = widget.productData.price;
                                    total = price! * counter;
                                    print(total);
                                  });
                                },
                                child: const Text("data"))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RatingBarIndicator(
                                  itemCount: 5,
                                  rating: widget.productData.rating!.rate!
                                      .toDouble(),
                                  itemSize: 25,
                                  itemBuilder: (context, index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    );
                                  },
                                ),
                                Text(
                                    "(${widget.productData.rating!.count} Review)")
                              ],
                            ),
                            const Text(
                              "Available in Stok",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Size",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: List.generate(
                                      5, (index) => const SizeCircle()),
                                )
                              ],
                            ),
                            Container(
                              height: height * 0.16,
                              width: width * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-4, -6),
                                        blurRadius: 20)
                                  ],
                                  borderRadius: BorderRadius.circular(28)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                    3,
                                    (index) => Container(
                                          height: height * 0.034,
                                          width: width * 0.08,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        )),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "${widget.productData.description}",
                          style: TextStyle(
                              height: height * 0.0016,
                              color: Colors.grey.shade700),
                        ).tr(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Total Price"),
                                  Text(
                                    "\$"
                                    "${widget.productData.price}",
                                    // "\$"
                                    // "$total",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              Consumer<CartProvider>(
                                builder: (context, value, child) {
                                  return RadiusButton(
                                    onPress: () {
                                      value.addToCart(widget.productData);
                                    },
                                    borderColor: Colors.black,
                                    height: height * 0.06,
                                    width: width * 0.54,
                                    textColor: Colors.white,
                                    bgColor: Colors.black,
                                    iconColor: Colors.white,
                                    icon: Icons.shopping_bag_outlined,
                                    text: const Text(
                                      "Add to cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
