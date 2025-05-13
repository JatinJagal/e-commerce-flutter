import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/home_screens/cart_screen.dart';
import 'package:e_commerce/screens/order_screen/order_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/images.dart';
import '../../widgets/cart_box.dart';
import '../../widgets/circle_button.dart';
import '../../widgets/ractengel_button.dart';

class OrdersScreen extends StatefulWidget {
  final ProductDataModel? productData;
  const OrdersScreen({this.productData, super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<CartProvider>().getUserCart();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: CirlceButton(
            onpress: () {
              Navigator.pop(context);
            },
            icon: arrowBack,
            bgColor: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "myCart",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ).tr(),

                  Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return SizedBox(
                        height: 540,
                        child: ListView.builder(
                          itemCount: value.cartList!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return CartBox(
                              removeItem: () {
                                if (value.cartItem > 0) {
                                  value.removeFromCart(value.cartList![index]);
                                }
                              },
                              title: "${value.cartList![index].title}",
                              price: "\$${value.cartList![index].price}",
                              image: "${value.cartList![index].image}",
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return Text(
                            "Total (${value.cartList!.length} item) :",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return Text(
                            "\$${value.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      )
                    ],
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return InkWell(
                        onTap: () {
                          if (value.cartList!.length > 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderDetailScreen()));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please add carts",
                                backgroundColor: Colors.white,
                                textColor: Colors.black);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          height: height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(14)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Proceed to Checkout",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: RactengleButton(
                                  icon: arrow,
                                  bgColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
