import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/screens/onboard_screens/next_screen.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/onboard_widget.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  var listOfOnBoard = const [
    OnboardWidget(
      imageUrl: onBoardImg1,
      title: "onBoardTitle",
      description: "description",
    ),
    OnboardWidget(
      imageUrl: onBoardImg2,
      title: "obBoardTitle2",
      description: "description",
    ),
    OnboardWidget(
      imageUrl: onBoardImg3,
      title: "obBoardTitle3",
      description: "description",
    ),
  ];

  final PageController controller = PageController();

  double page = 0;
  onBoardChange(double currentPage) {
    setState(() {
      page = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    controller.addListener(() {
      onBoardChange(controller.page as double);
    });
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            height: height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Row(
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        height: height * 0.01, //15
                        width: page == index
                            ? width * 0.08
                            : width * 0.02, //40 : 15
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: page == index ? Colors.black : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: height * 0.02, bottom: height * 0.02),
                  child: CirlceButton(
                    icon: nextIcon,
                    bgColor: Colors.black,
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NextScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
          body: PageView(
            controller: controller,
            children: listOfOnBoard,
          )),
    );
  }
}
