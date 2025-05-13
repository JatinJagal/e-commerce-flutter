import 'package:flutter/material.dart';

class AdvertiseCard extends StatelessWidget {
  const AdvertiseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: height * 0.22,
      width: width * 0.78,
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "50% Off",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text(
              "On everything today",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "With code: FSCREATION",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.04,
              width: width * 0.28,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "Get Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
