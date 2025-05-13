import 'dart:io';

import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/screens/home_screens/bottom_navbar.dart';
import 'package:e_commerce/utils/validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/radius_button.dart';
import '../../widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;

  String constImage =
      "https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  // File? _image;
  // final picker = ImagePicker();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void takeImage(ImageSource source) async {
    final pickImage = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickImage;
    });
  }

  Future signUp() async {
    final postData = await apiService.post("users/", {
      "name": "Nicolas",
      "email": "jatin@gmail.com",
      "password": "1234",
      "avatar": "https://picsum.photos/800"
    });

    if (postData!.statusCode == 201) {
      final result = postData.data['role'];
      print(result);
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final conPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: height * 0.02, vertical: height * 0.03),
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
                  Center(
                      child: InkWell(
                    onTap: () {
                      takeImage(ImageSource.gallery);
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: _imageFile == null
                          ? Image.network(shoesImg)
                          : Image.file(File(_imageFile!.path)),
                    ),
                  )),
                  SizedBox(
                    height: height * 0.098,
                  ),
                  const Text(
                    "signup",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ).tr(),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  const Text("creatnewacc",
                          style: TextStyle(fontSize: 14, color: Colors.grey))
                      .tr(),
                  SizedBox(
                    height: height * 0.032,
                  ),
                  TextFieldWidget(
                      label: "username",
                      controller: nameController,
                      validator: userNameValidator),
                  TextFieldWidget(
                    label: "email",
                    controller: emailController,
                    validator: emailValidator,
                  ),
                  TextFieldWidget(
                    label: "password",
                    controller: passController,
                    validator: passValidator,
                  ),
                  TextFieldWidget(
                    label: "conPassword",
                    controller: conPassController,
                    validator: passValidator,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                          value: value,
                          onChanged: (va) {
                            setState(() {
                              value = !value;
                            });
                          }),
                      const Text(
                        "privacyPolicy",
                        style: TextStyle(color: Colors.grey),
                      ).tr()
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, value, child) {
                      return RadiusButton(
                        width: double.infinity,
                        height: height * 0.06,
                        borderColor: Colors.transparent,
                        text: value.isLoading == true
                            ? const CircularProgressIndicator()
                            : const Text("signup",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                        bgColor: Colors.black,
                        textColor: Colors.white,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await value.signUpWithEmail(UserData(
                                username: nameController.text,
                                email: emailController.text,
                                password: passController.text));

                            if (result) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationScreen()),
                                  (route) => false);
                            }
                          }
                        },
                      );
                    },
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
