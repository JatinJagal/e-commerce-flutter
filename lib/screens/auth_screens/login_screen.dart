import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/screens/home_screens/bottom_navbar.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:e_commerce/widgets/textfield_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.090,
                  ),
                  Center(child: FlutterLogo(size: height * 0.1)),
                  SizedBox(
                    height: height * 0.098,
                  ),
                  const Text(
                    "welcome",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ).tr(),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  const Text("welcomeDes",
                          style: TextStyle(fontSize: 14, color: Colors.grey))
                      .tr(),
                  SizedBox(
                    height: height * 0.032,
                  ),
                  TextFieldWidget(
                    label: "email",
                    controller: usernameController,
                    validator: userNameValidator,
                  ),
                  TextFieldWidget(
                    validator: passValidator,
                    label: "password",
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, value, child) {
                      return RadiusButton(
                        width: double.infinity,
                        height: height * 0.06,
                        borderColor: Colors.transparent,
                        text: value.isLoading == true
                            ? const CircularProgressIndicator()
                            : const Text(
                                "login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                        bgColor: Colors.black,
                        textColor: Colors.white,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            print("Liogasoiin");
                            final result = await value.loginWithUserName(
                                UserData(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ).toJson(),
                                usernameController.text);

                            if (result) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationScreen()),
                                  (route) => false);
                            } else {
                              Fluttertoast.showToast(msg: "Failed");
                            }
                          }
                        },
                      );
                    },
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Text(" or "),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  RadiusButton(
                    borderColor: Colors.transparent,
                    width: double.infinity,
                    height: height * 0.06,
                    text: const Text("continueWithFacebook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    bgColor: const Color.fromARGB(255, 8, 84, 147),
                    onPress: () {},
                    icon: Icons.facebook,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                  ),
                  RadiusButton(
                    borderColor: Colors.grey,
                    text: const Text("continueWithGoogle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    width: double.infinity,
                    height: height * 0.06,
                    bgColor: Colors.transparent,
                    icon: Icons.g_mobiledata,
                    textColor: Colors.grey[700],
                    iconColor: Colors.black,
                  ),
                  RadiusButton(
                    borderColor: Colors.grey,
                    text: const Text("continueWithApple",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    width: double.infinity,
                    height: height * 0.06,
                    bgColor: Colors.transparent,
                    icon: Icons.apple,
                    textColor: Colors.grey[700],
                    iconColor: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
