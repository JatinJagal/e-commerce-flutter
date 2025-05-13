import 'package:e_commerce/screens/order_screen/orders_screen.dart';
import 'package:flutter/material.dart';

class CartCircleButton extends StatelessWidget {
  final VoidCallback? onPress;
  const CartCircleButton({this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(-6, 6), blurRadius: 16)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
