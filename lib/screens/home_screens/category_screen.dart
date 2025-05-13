import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/filter_screen/filter_screen.dart';
import 'package:e_commerce/screens/search_screen/search_screen.dart';
import 'package:e_commerce/screens/tabbar_screens/drasess_tab.dart';
import 'package:e_commerce/screens/tabbar_screens/jacket_tab.dart';
import 'package:e_commerce/screens/tabbar_screens/jeans_tab.dart';
import 'package:e_commerce/screens/tabbar_screens/shoes_tab.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/product_arrival.dart';
import 'package:e_commerce/widgets/ractengel_button.dart';
import 'package:e_commerce/widgets/search_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/tab_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const Drawer(
          child: Column(
            children: [Text("data")],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: height * 0.12,
                        width: width * 0.12,
                        child: const CircleAvatar()),
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: Consumer<ProductProvider>(
                  builder: (context, value, child) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: CirlceButton(
                          icon: menuIcon,
                          bgColor: Colors.black,
                          onpress: () {
                            // print(value.allproducts!.first.title);
                            Scaffold.of(context).openDrawer();
                          },
                        ));
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "welcome",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ).tr(),
                        SizedBox(
                          height: height * 0.006,
                        ),
                        Text("ourFashion",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600))
                            .tr(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: width * 0.70,
                                child: SearchField(onpress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchScreen()));
                                })),
                            CirlceButton(
                              icon: filterIcon,
                              bgColor: Colors.black,
                              onpress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FilterScreen()));
                              },
                            ),
                          ],
                        ),
                        const ProductArrivalCard(
                            price: "\$245.00",
                            image: shoesImg,
                            title: "Alex Arigato",
                            description: "Clean 90 triple Sneakers",
                            button: RactengleButton(
                                icon: nextIcon, bgColor: Colors.black)),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        const Text(
                          "category",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ).tr(),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        TabBar(
                            labelPadding: const EdgeInsets.only(right: 12),
                            // isScrollable: true,
                            indicatorPadding: const EdgeInsets.only(
                                top: 8, bottom: 10, left: 0, right: 0.0),
                            indicator: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(28))),
                            controller: _tabController,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              TabWidget(label: "Men's", radius: 24),
                              TabWidget(label: "Women's", radius: 24),
                              TabWidget(label: "Jwellery", radius: 24),
                              TabWidget(label: "Electro", radius: 24)
                            ])
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(controller: _tabController, children: const [
            DrasessTab(),
            JacketTab(),
            JeansTab(),
            ShoesTab()
          ]),
        ),
      ),
    );
  }
}
