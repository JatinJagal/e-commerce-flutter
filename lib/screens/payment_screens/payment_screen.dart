import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/utils/utils.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/payment_button.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final iconList = [creditCard, payPal, visa, gPay, cashOnDelivery];

  final labelText = [
    "Credit Card",
    "Paypal",
    "Visa",
    "Gpay",
    "Cash on delivery"
  ];

  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: PaymentButton(
                icon: iconList[index],
                bgColor: currentIndex == index ? Colors.black : Colors.white,
                borderColor:
                    currentIndex == index ? Colors.white : Colors.black,
                label: labelText[index],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: RadiusButton(
          borderColor: Colors.black,
          height: 45,
          text: const Text(
            "Make Payment",
            style: TextStyle(color: Colors.white),
          ),
          onPress: () {
            openDialogBox(context);
          },
          bgColor: Colors.black,
          icon: Icons.payment,
          iconColor: Colors.white,
          textColor: Colors.white),
    );
  }
}
