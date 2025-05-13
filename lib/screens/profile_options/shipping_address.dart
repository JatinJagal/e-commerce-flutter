import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/storage_provider.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddressDetail();
  }

  String streetName = "";
  String cityName = "";
  String numberIndex = "";
  String zipCode = "";
  String phoneNumber = "";

  Future getAddressDetail() async {
    final street = await StorageProvider.i.getStorageValue("street");
    final city = await StorageProvider.i.getStorageValue("city");
    final number = await StorageProvider.i.getStorageValue("number");
    final zipcode = await StorageProvider.i.getStorageValue("zipcode");
    final phone = await StorageProvider.i.getStorageValue("phone");

    setState(() {
      streetName = street;
      cityName = city;
      numberIndex = number;
      zipCode = zipcode;
      phoneNumber = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
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
        padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(-10, 8), color: Colors.grey, blurRadius: 20)
              ],
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text(
                    "Street:  ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(streetName)
                ],
              ),
              Row(
                children: [
                  const Text("City:  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(cityName)
                ],
              ),
              Row(
                children: [
                  const Text("Number:  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(numberIndex)
                ],
              ),
              Row(
                children: [
                  const Text("Zip code:  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(zipCode)
                ],
              ),
              Row(
                children: [
                  const Text("Phone Number:  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(phoneNumber)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
