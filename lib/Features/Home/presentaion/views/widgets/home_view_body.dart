import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'center_section_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppBar(),
            SizedBox(height: 25),
            CenterSection(),
          ],
        ),
      ),
    );
  }
}
