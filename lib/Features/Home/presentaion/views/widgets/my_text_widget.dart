import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget(
      {super.key, required this.title, required this.description});
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Styles.textStyle20.copyWith(
            color: const Color(0xFF011444),
          ),
        ),
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: const StrutStyle(fontSize: 12.0),
            text: TextSpan(
              style: Styles.textStyle18.copyWith(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              text: description,
            ),
          ),
        ),
      ],
    );
  }
}
