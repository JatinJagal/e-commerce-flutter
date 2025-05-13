import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/storage_provider.dart';
import 'package:e_commerce/screens/order_screen/edit_address.dart';
import 'package:e_commerce/screens/payment_screens/payment_screen.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/custom_info_row.dart';
import 'package:e_commerce/widgets/product_arrival.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddressDetail();
  }

  String streetName = "";
  String cityName = "";
  String numberIndex = "";
  String zipCode = "";
  String phoneNumber = "";

  Future getAddressDetail() async {
    final street = await StorageProvider.i.getStorageValue("street");
    final city = await StorageProvider.i.getStorageValue("city");
    final number = await StorageProvider.i.getStorageValue("number");
    final zipcode = await StorageProvider.i.getStorageValue("zipcode");
    final phone = await StorageProvider.i.getStorageValue("phone");

    setState(() {
      streetName = street;
      cityName = city;
      numberIndex = number;
      zipCode = zipcode;
      phoneNumber = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: CirlceButton(
                icon: arrowBack,
                bgColor: Colors.black,
                onpress: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.85,
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 12.0, right: 12.0, left: 12.0),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 14,
                                // spreadRadius: 8,
                                offset: Offset(4, -2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Column(
                        children: [
                          CustomInfoRow(
                            data: streetName,
                            title: "Street: ",
                          ),
                          CustomInfoRow(
                            data: cityName,
                            title: "City: ",
                          ),
                          CustomInfoRow(
                            data: numberIndex,
                            title: "Number: ",
                          ),
                          CustomInfoRow(
                            data: zipCode,
                            title: "Zip code: ",
                          ),
                          CustomInfoRow(
                            data: phoneNumber,
                            title: "Phone Number: ",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditAddressScreen()));
                      },
                      child: const Text(
                        "Edit Address",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    "Product Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children:
                            List.generate(value.cartList!.length, (index) {
                          final item = value.cartList![index];
                          return Dismissible(
                            // onDismissed: (direction) {
                            //   setState(() {
                            //     if (value.cartItem > 0) {
                            //       value.removeFromCart(value.cartList![index]);
                            //     }
                            //   });
                            // },
                            confirmDismiss: (direction) {
                              return Future.value(true);
                            },
                            key: Key("${value.cartList![index].price}"),
                            background: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: const Center(
                                  child: Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            child: ProductArrivalCard(
                              image: "${value.cartList![index].image}",
                              button: const Text(""),
                              description: "gfgsdgfds",
                              price: "\$${value.cartList![index].price}",
                              title: "${value.cartList![index].title}",
                            ),
                          );
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(12.0),
            height: height * 0.1,
            color: Colors.white,
            width: double.infinity,
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text("\$${value.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        if (value.cartList!.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                        } else {
                          Fluttertoast.showToast(msg: "Cart is Empty");
                        }
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.4,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                        child: const Center(
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
