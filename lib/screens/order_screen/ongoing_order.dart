import 'package:flutter/material.dart';

import '../../widgets/order_card.dart';

class OngoingOrders extends StatefulWidget {
  const OngoingOrders({super.key});

  @override
  State<OngoingOrders> createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 540,
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const OrderCard();
          },
        ),
      ),
    );
  }
}
