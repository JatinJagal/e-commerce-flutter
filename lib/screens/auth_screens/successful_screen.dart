import 'package:e_commerce/widgets/radius_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuccessfullScreen extends StatefulWidget {
  const SuccessfullScreen({super.key});

  @override
  State<SuccessfullScreen> createState() => _SuccessfullScreenState();
}

class _SuccessfullScreenState extends State<SuccessfullScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: height * 0.009, right: height * 0.009),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: height * 0.34,
              width: double.infinity,
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 64,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const Text(
                    "successful",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ).tr(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "successDes",
                    style: TextStyle(fontSize: 16),
                  ).tr()
                ],
              ),
            ),
            SizedBox(
              height: height * 0.18,
            ),
            RadiusButton(
              borderColor: Colors.transparent,
              text: Text("start"),
              width: double.infinity,
              height: height * 0.06,
              bgColor: Colors.black,
              onPress: () {},
              textColor: Colors.white,
            ),
            SizedBox(
              height: height * 0.1,
            )
          ],
        ),
      ),
    ));
  }
}
