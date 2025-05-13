import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:e_commerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
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
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
        child: Column(
          children: [
            CustomTextField("Street"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField("City"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField("Number"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField("Zip code"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField("Phone number"),
            SizedBox(
              height: height * 0.01,
            ),
            RadiusButton(
              borderColor: Colors.black,
              text: const Text(
                "Edit Address",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              bgColor: Colors.black,
              height: height * 0.06,
            )
          ],
        ),
      ),
    ));
  }
}

// ignore: non_constant_identifier_names
Widget CustomTextField(
  String? label,
) {
  return TextFormField(
    decoration: InputDecoration(
        label: Text(
          label!,
          style: const TextStyle(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
  );
}
