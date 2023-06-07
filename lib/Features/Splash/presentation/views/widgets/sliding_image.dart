import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
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
          child: Image.asset(
            'assets/images/app_logo.png',
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
        );
      }),
    );
  }
}
