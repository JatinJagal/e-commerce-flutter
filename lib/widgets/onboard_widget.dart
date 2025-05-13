import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class OnboardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  const OnboardWidget({this.imageUrl, this.title, this.description, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FadeInDown(
                child: Container(
                  height: height * 0.54,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                            imageUrl!,
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              title!,
              style: TextStyle(
                height: height * 0.0018,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
            SizedBox(
              height: height * 0.048,
            ),
            Text(
              description!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
