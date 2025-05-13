import 'package:e_commerce/screens/setting_screen/settings_screen.dart';
import 'package:e_commerce/widgets/ractengel_button.dart';
import 'package:flutter/material.dart';

class OptionRow extends StatelessWidget {
  final String? icon;
  final String? text;
  const OptionRow({this.icon, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      height: height * 0.068,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RactengleButton(
                bgColor: Colors.grey.shade300,
                icon: icon,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                text!, //"Personal Details"
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
