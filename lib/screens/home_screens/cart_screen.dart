import 'package:e_commerce/screens/order_screen/completed_order.dart';
import 'package:e_commerce/screens/order_screen/ongoing_order.dart';
import 'package:e_commerce/widgets/tab_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  // toolbarHeight: 70,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  // leading: Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  //   child: CirlceButton(
                  //     icon: arrowBack,
                  //     bgColor: Colors.black,
                  //     onpress: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "myOrders",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ).tr(),
                                Row(
                                  children: [
                                    TabBar(
                                        dividerColor: Colors.transparent,
                                        labelPadding:
                                            const EdgeInsets.only(right: 12),
                                        isScrollable: true,
                                        indicatorPadding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 10,
                                            left: 0,
                                            right: 0.0),
                                        indicator: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(28))),
                                        controller: _tabController,
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        tabs: const [
                                          TabWidget(
                                              label: "Ongoing", radius: 12),
                                          TabWidget(
                                            label: "Completed",
                                            radius: 12,
                                          )
                                        ])
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
                controller: _tabController,
                children: const [OngoingOrders(), CompletedOrders()])));
  }
}
