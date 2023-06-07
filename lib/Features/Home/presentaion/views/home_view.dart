import 'package:flutter/material.dart';
import 'widgets/add_account_dialog.dart';
import 'widgets/floating_action_button_widget.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddAccountDialog();
            },
          );
        },
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const HomeViewBody(),
    );
  }
}
