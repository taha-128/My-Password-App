import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.fieldName,
  });

  final TextEditingController controller;
  final String hintText, fieldName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (_) {
        if (controller.text.isEmpty) {
          return '$fieldName field can\'t be empty';
        } else {
          return null;
        }
      },
      style: Styles.textStyle18.copyWith(color: Colors.black),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: Colors.white,
        hintText: hintText,
        errorStyle: Styles.textStyle10r.copyWith(fontSize: 13),
        helperStyle: Styles.textStyle20,
        filled: true,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

var outlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 2.2,
    color: Colors.black,
  ),
  borderRadius: BorderRadius.circular(15),
);
