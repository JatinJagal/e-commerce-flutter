import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/storage_provider.dart';
import 'package:e_commerce/screens/onboard_screens/next_screen.dart';
import 'package:e_commerce/widgets/profile_detail.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile();
  }

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

  int value = 1;

  // ignore: non_constant_identifier_names
  Widget CustomRadioButton(String title, int index) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            value = index;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              value == index ? Colors.black : Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 1,
                      color: value == index ? Colors.white : Colors.grey)),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style:
                  TextStyle(color: value == index ? Colors.white : Colors.grey),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Positioned(
                      // top: 10,
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.2,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-20, 20),
                                  blurRadius: 40)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(profileImg))),
                      ),
                    ),
                    Positioned(
                        top: 35,
                        left: 44,
                        height: 30,
                        width: 30,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(10, 10),
                                  blurRadius: 20)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "Upload Image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileDetail(
                text: userName,
                title: "Name",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadioButton("Male", 1),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomRadioButton("Female", 2)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const ProfileDetail(
                text: "22 Years",
                title: "Age",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileDetail(
                text: userEmail,
                title: "Email",
              ),
            ],
          ),
        ),
        bottomNavigationBar: RadiusButton(
          borderColor: Colors.black,
          bgColor: Colors.black,
          text: Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
          onPress: () async {
            StorageProvider.i.removeToken('token');
            StorageProvider.i.removeToken("id");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NextScreen()),
                (route) => false);
          },
          textColor: Colors.white,
          height: height * 0.06,
        ),
      ),
    );
  }
}
