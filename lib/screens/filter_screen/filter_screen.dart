import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/search_screen/search_screen.dart';
import 'package:e_commerce/widgets/circle_button.dart';
import 'package:e_commerce/widgets/radius_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int currentVal = 0;

  var listTitle = [
    "Drasses",
    "Jacket",
    "Jeans",
    "Shoes",
    "Bags",
    "Clothes",
    "Jeans",
    "Shorts",
    "Tops",
    "Sneakers",
    "Cots",
    "Lingenies"
  ];

  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: height * 0.12,
                        width: width * 0.12,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchScreen()));
                                },
                                icon: const Icon(Icons.search)),
                          ),
                        )),
                  )
                ],
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: CirlceButton(
                    icon: arrowBack,
                    onpress: () {
                      Navigator.pop(context);
                    },
                    bgColor: Colors.black,
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Category",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                crossAxisCount: 4,
                childAspectRatio: (itemWidth / 70),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                mainAxisSpacing: 4.0,
                scrollDirection: Axis.vertical,
                children: List.generate(
                    12,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentVal = index;
                            });
                          },
                          child: FilterTab(
                            title: listTitle[index],
                            bgColor: currentVal == index
                                ? Colors.black
                                : Colors.white,
                            textColor: currentVal == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Price Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                  value: currentIndex,
                  max: 100,
                  min: 0,
                  onChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("\$0"), Text("\$750"), Text("\$1750")],
                ),
              ),
            ]),
          )),
      bottomNavigationBar: RadiusButton(
        borderColor: Colors.black,
        textColor: Colors.white,
        bgColor: Colors.black,
        height: height * 0.06,
        text: const Text(
          "Apply Now",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final Color? bgColor;
  final Color? textColor;
  final String? title;
  const FilterTab({this.bgColor, this.textColor, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      height: 20,
      width: 80,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)), //24
          border: Border.all(color: Colors.grey, width: 1)),
      child: Center(
          child: Text(
        title!,
        style: TextStyle(color: textColor),
      )),
    );
  }
}
