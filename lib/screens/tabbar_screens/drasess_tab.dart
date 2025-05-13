import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/details_screen/product_details.dart';
import 'package:e_commerce/widgets/advertise_card.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:e_commerce/widgets/product_propular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class DrasessTab extends StatefulWidget {
  const DrasessTab({super.key});

  @override
  State<DrasessTab> createState() => _DrasessTabState();
}

class _DrasessTabState extends State<DrasessTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 2), () {
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().getProductList("category/men's clothing");
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "clothes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ).tr(),
            SizedBox(
              height: height * 0.01,
            ),
            Consumer<ProductProvider>(
              builder: (context, value, child) {
                if (value.productList != null) {
                  final data = value.productList!;
                  return value.isLoading == true
                      ? const CircularProgressIndicator()
                      : AnimationLimiter(
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: (itemWidth / 320),
                            controller:
                                ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            mainAxisSpacing: 8.0,
                            scrollDirection: Axis.vertical,
                            children: List.generate(
                                data.length,
                                (index) => AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      delay: const Duration(microseconds: 4000),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailScreen(
                                                          productData:
                                                              data[index],
                                                        )));
                                          },
                                          child: ProductCard(
                                            title: "${data[index].title}",
                                            image: "${data[index].image}",
                                            description:
                                                "${data[index].description}",
                                            price: "${data[index].price}",
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AdvertiseCard(),
                  AdvertiseCard(),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const PopularProduct(
                    title: "Gia Borgghini",
                    image: shoesImg,
                    price: "750",
                  );
                })
          ],
        ),
      ),
    );
  }
}











// Consumer<ProductProvider>(
//               builder: (context, value, child) {
//                 if (value.productList != null) {
//                   final data = value.productList!;
//                   return Container(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       childAspectRatio: (itemWidth / 320),
//                       controller: ScrollController(keepScrollOffset: false),
//                       shrinkWrap: true,
//                       mainAxisSpacing: 8.0,
//                       scrollDirection: Axis.vertical,
//                       children: List.generate(
//                           data.length,
//                           (index) => InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ProductDetailScreen(
//                                                 productData: data[index],
//                                               )));
//                                 },
//                                 child: ProductCard(
//                                   title: "${data[index].title}",
//                                   image: "${data[index].image}",
//                                   description: "${data[index].description}",
//                                   price: "${data[index].price}",
//                                 ),
//                               )),
//                     ),
//                   );
//                 }
//                 return const Center(child: CircularProgressIndicator());
//               },
//             ),




