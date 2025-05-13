import 'package:e_commerce/providers/storage_provider.dart';
import 'package:e_commerce/screens/home_screens/cart_screen.dart';
import 'package:e_commerce/screens/order_screen/orders_screen.dart';
import 'package:e_commerce/screens/profile_options/my_favourite.dart';
import 'package:e_commerce/screens/profile_options/personal_detail.dart';
import 'package:e_commerce/screens/profile_options/shipping_address.dart';
import 'package:e_commerce/screens/setting_screen/settings_screen.dart';
import 'package:e_commerce/widgets/option_row.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../widgets/cart_circle_button.dart';
import '../../widgets/circle_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var listOfOption = [
    "Personal Details",
    "My Order",
    "My Favourite",
    "Shipping Address",
    "Settings"
  ];

  var listOfIcon = [profileIcon, cartIcon, likeIcon, deliveryIcon, settingIcon];

  var listOfScreens = const [
    PersonalDetailScreen(),
    CartScreen(),
    MyFavouriteScreen(),
    ShippingAddressScreen(),
    SettingsScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile();
  }

  int currentIndex = 0;

  String userName = "";
  String userEmail = "";

  Future getUserProfile() async {
    var username = await StorageProvider.i.getStorageValue("username");
    var email = await StorageProvider.i.getStorageValue("email");

    setState(() {
      userName = username;
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CartCircleButton()],
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: CirlceButton(
              icon: arrowBack,
              bgColor: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                height: height * 0.12,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-6, 10),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.08,
                      width: width * 0.18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(profileImg)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.004,
                        ),
                        Text(userEmail)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                height: height * 0.38,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        listOfScreens[index]));
                          },
                          child: OptionRow(
                            text: listOfOption[index],
                            icon: listOfIcon[index],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
