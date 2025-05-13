import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/screens/home_screens/bottom_navbar.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigationScreen()));
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 14.0, right: 14.0, top: 16.0),
                height: height * 0.22,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-2, 0),
                          color: Colors.grey,
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Id: 6556 23341 2546"),
                            Text(
                              "Ena Express",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Text("Transit")
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FlutterStepIndicator(
                      onChange: (value) {},
                      list: const [1, 2, 3, 4],
                      page: 2,
                      height: 20,
                      progressColor: Colors.black,
                      positiveColor: Colors.black,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("25 June 2021"),
                            Text("Sacramto"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("30 June 2021"),
                            Text("Tamilnadu"),
                          ],
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: height * 0.04,
            ),
            const Text(
              "Tracking",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                    growable: true,
                    4,
                    (index) => Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: height * 0.11,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(-4, 10),
                                    color: Colors.grey,
                                    blurRadius: 10)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.08,
                                width: height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: const Center(
                                    child:
                                        Icon(Icons.delivery_dining_outlined)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "US 2343445668",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Tamilnadu",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              const Text(
                                "Transit",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
