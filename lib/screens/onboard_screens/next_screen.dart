import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/screens/auth_screens/login_screen.dart';
import 'package:e_commerce/screens/auth_screens/signup_screen.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(splashImage), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RadiusButton(
                      width: double.infinity,
                      height: height * 0.06,
                      text: const Text("login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      bgColor: Colors.white,
                      borderColor: Colors.transparent,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      textColor: Colors.black),
                  RadiusButton(
                      text: Text(
                        "signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      width: double.infinity,
                      height: height * 0.06,
                      bgColor: Colors.transparent,
                      borderColor: Colors.white,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      textColor: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
