import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/details_screen/product_details.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/product_propular.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
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
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          children: [
            Consumer<ProductProvider>(
              builder: (context, value, child) {
                return SizedBox(
                  height: height * 0.07,
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (val) {
                      value.search(val);
                    },
                    decoration: InputDecoration(
                        hintText: "Search Product",
                        fillColor: Colors.grey.shade200,
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28)))),
                  ),
                );
              },
            ),
            Expanded(child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.searchList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                    productData: value.searchList[index])));
                      },
                      child: PopularProduct(
                        title: "${value.searchList[index].title}",
                        image: "${value.searchList[index].image}",
                        price: "${value.searchList[index].price}",
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}














// Expanded(child: Consumer<ProductProvider>(
//               builder: (context, value, child) {
//                 return ListView.builder(
//                   itemCount: value.productList!.length,
//                   itemBuilder: (context, index) {
//                     final item = value.productList![index];
//                     final hasValue = searchText
//                         .toLowerCase()
//                         .contains(item.title!.toLowerCase());
//                     if (hasValue) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       ProductDetailScreen(productData: item)));
//                         },
//                         child: PopularProduct(
//                           title: "${item.title}",
//                           image: "${item.image}",
//                           price: "${item.price}",
//                         ),
//                       );
//                     }
//                     return const SizedBox();
//                   },
//                 );
//               },
//             )
            
//             )





















// Expanded(child: Consumer<ProductProvider>(
//               builder: (context, value, child) {
//                 return ListView.builder(
//                   itemCount: value.searchList.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ProductDetailScreen(
//                                     productData: value.searchList[index])));
//                       },
//                       child: PopularProduct(
//                         title: "${value.searchList[index].title}",
//                         image: "${value.searchList[index].image}",
//                         price: "${value.searchList[index].price}",
//                       ),
//                     );
//                   },
//                 );
//               },
//             ))