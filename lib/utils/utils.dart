import 'package:e_commerce/screens/order_status_screens/order_track_screen.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

isEmail(String input) =>
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(input);
isPhone(String input) => RegExp(r"^\d+$").hasMatch(input);

Future openDialogBox(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          content: Container(
            height: 200,
            width: 360,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 50,
                ),
                const Text(
                  "Successful!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "successfulPayment",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ).tr(),
                RadiusButton(
                  borderColor: Colors.black,
                  icon: Icons.navigate_next_rounded,
                  iconColor: Colors.white,
                  text: const Text(
                    "continue Shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                  bgColor: Colors.black,
                  height: 40,
                  width: 180,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderTrackingScreen()));
                  },
                ),
              ],
            ),
          ));
    },
  );
}
