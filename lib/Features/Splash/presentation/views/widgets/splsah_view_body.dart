import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Features/Auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_password/Features/Home/presentaion/views/home_view.dart';

import '../../../../Auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'sliding_image.dart';
import 'sliding_text.dart';

class SplsahViewBody extends StatefulWidget {
  const SplsahViewBody({Key? key}) : super(key: key);

  @override
  State<SplsahViewBody> createState() => _SplsahViewBodyState();
}

class _SplsahViewBodyState extends State<SplsahViewBody>
    with TickerProviderStateMixin {
  late AnimationController textController;
  late AnimationController imageController;
  late Animation<Offset> slidingTextAnimation;
  late Animation<Offset> slidingImageAnimation;

  @override
  void initState() {
    initSlidingTextAnimation();
    initSlidingImageAnimation();
    navigateToRegister();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlidingImage(animation: slidingImageAnimation),
          const SizedBox(
            height: 4,
          ),
          SlidingText(
            animation: slidingTextAnimation,
          ),
        ],
      ),
    );
  }

  void initSlidingTextAnimation() {
    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slidingTextAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero).animate(
      textController,
    );
    textController.forward();
  }

  void initSlidingImageAnimation() {
    imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slidingImageAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
            .animate(imageController);
    imageController.forward();
  }

  void navigateToRegister() {
    bool isVerified = BlocProvider.of<LoginCubit>(context).isVerified;
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                isVerified ? const HomeView() : const RegisterView(),
            transitionDuration: const Duration(milliseconds: 1900),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
              opacity: a,
              child: c,
            ),
          ),
        );
      },
    );
  }

  BoxDecoration boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFFBECE5C),
        Color(0xFFFFFFFF),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
}
