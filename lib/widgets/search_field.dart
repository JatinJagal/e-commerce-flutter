import 'package:e_commerce/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final VoidCallback? onpress;
  const SearchField({this.onpress, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.07,
      child: TextFormField(
        onTap: onpress,
        readOnly: true,
        // onChanged: ,
        decoration: InputDecoration(
            hintText: "Search Categories",
            fillColor: Colors.grey.shade200,
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(28)))),
      ),
    );
  }
}
