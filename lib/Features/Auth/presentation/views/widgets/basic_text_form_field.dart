import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';

class BasicTextFormField extends StatelessWidget {
  const BasicTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validate,
    this.suffix,
  });
  final TextEditingController controller;
  final String labelText, hintText;
  final Function(String?) validate;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    var basicBorder = border(
        MyColors.darkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Styles.textStyle13.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          validator: (_) {
            return validate(_);
          },
          controller: controller,
          autofocus: false,
          style: Styles.textStyle15.copyWith(
            fontWeight: FontWeight.normal,
            color: MyColors.darkMode
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF000000),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Styles.textStyle13.copyWith(
              color: Color(MyColors.darkMode ? 0xFFFFFFFF : 0xFF000000)
                  .withOpacity(.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 11, vertical: 16),
            filled: true,
            fillColor: MyColors.darkMode
                ? const Color(0xFF454642)
                : MyColors.kLightGrey,
            enabledBorder: basicBorder,
            focusedBorder: basicBorder,
            errorBorder: border(MyColors.kRed),
            errorStyle: Styles.textStyle13,
            focusedErrorBorder: border(MyColors.kRed),
            suffix: suffix,
          ),
        ),
        const SizedBox(
          height: 23,
        ),
      ],
    );
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
    );
  }
}
