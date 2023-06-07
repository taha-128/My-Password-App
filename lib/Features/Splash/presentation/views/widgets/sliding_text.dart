import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: ((context, child) {
        return SlideTransition(
          position: animation,
          child: Text(
            'Save your passwords in less than a minute',
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
        );
      }),
    );
  }
}
