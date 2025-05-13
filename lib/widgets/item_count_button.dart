import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCountButton extends StatelessWidget {
  final Color? bgColor;
  final String? cartIndex;
  final VoidCallback? increment;
  final VoidCallback? decrease;
  const ItemCountButton(
      {this.bgColor, this.cartIndex, this.increment, this.decrease, super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: 40,
        width: width * 0.3, //106
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: decrease,
                icon: const Icon(
                  Icons.remove,
                  size: 16,
                )),
            Text(
              cartIndex!,
              style: TextStyle(fontSize: 10),
            ),
            IconButton(
                onPressed: increment,
                icon: const Icon(
                  Icons.add,
                  size: 16,
                ))
          ],
        ));
  }
}
