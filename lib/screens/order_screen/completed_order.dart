import 'package:flutter/material.dart';

import '../../widgets/order_card.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({super.key});

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
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
