import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.begin,
      required this.end,
      required this.splashColor});
  final GestureTapCallback onPressed;
  final Color begin, end, splashColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .056,
      decoration: myDecoration(
        colors: [begin, end],
        borderRadius: 12,
        border: 2,
      ),
      child: MaterialButton(
        height: MediaQuery.of(context).size.height * .056,
        minWidth: MediaQuery.of(context).size.width * .28,
        onPressed: onPressed,
        splashColor: splashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}

BoxDecoration myDecoration(
    {required List<Color> colors,
    required double borderRadius,
    double? border}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    gradient: LinearGradient(
      colors: colors,
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    border: Border.all(
      width: border ?? 0,
    ),
  );
}
