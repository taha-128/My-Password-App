import 'init_user_image_widget.dart';
import 'user_display_name_widget.dart';
import 'package:flutter/material.dart';
import 'buttons_column_widget.dart';
import 'custom_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: const [
              CustomAppBar(),
              SizedBox(height: 38),
              InitUserImageWidget(fontSize: 120),
              SizedBox(height: 12),
              UserDisplayNameWidget(),
              SizedBox(height: 40),
              ButtonsColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
