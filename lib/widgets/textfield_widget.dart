import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

typedef Validator<T> = String? Function(T? value);

class TextFieldWidget extends StatefulWidget {
  final String? label;
  final Validator<String>? validator;
  final TextEditingController? controller;
  const TextFieldWidget(
      {this.label, this.validator, this.controller, super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
          label: Text(widget.label!).tr(),
          suffixIcon: Icon(
            Icons.check_circle,
            color: Colors.black,
            size: height * 0.023,
          ),
          labelStyle: const TextStyle(color: Colors.black),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
