import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
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
          padding: const EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
          child: Consumer<CartProvider>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children:
                        List.generate(value.favouriteItemList!.length, (index) {
                  return FavouriteCard(
                    image: value.favouriteItemList![index].image,
                    title: value.favouriteItemList![index].title,
                    price: value.favouriteItemList![index].price.toString(),
                  );
                })),
              );
            },
          )),
    );
  }
}
