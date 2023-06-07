import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_themes.dart';
import 'package:my_password/Features/Profile/presentation/cubit/profile_cubit.dart';
import 'package:my_password/Core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'custom_icon_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onTap: () {
                  context.pop();
                },
                color: Theme.of(context).colorScheme.secondary,
                iconPath: Svgs.back,
              ),
              CustomIconButton(
                onTap: () {
                  cubit.changeTheme(context);
                },
                iconPath: cubit.themeData == AppThemes.darkTheme
                    ? Svgs.lightMode
                    : Svgs.darkMode,
              ),
            ],
          );
        },
      ),
    );
  }
}
