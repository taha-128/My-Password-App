import 'package:my_password/Features/Profile/presentation/views/widgets/init_user_image_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'detail_widget.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});
  static String? userSpace;

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InitUserImageWidget(fontSize: 120),
          const SizedBox(height: 50),
          Detail(label: 'Display Name', content: user.displayName!),
          Detail(label: 'Email', content: user.email!),
          Detail(label: 'User Space', content: userSpace!),
        ],
      ),
    );
  }
}
