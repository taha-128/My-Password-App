import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/app_themes.dart';
import 'package:my_password/Features/Auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:my_password/Features/Profile/presentation/cubit/profile_cubit.dart';

import 'Features/Auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final profileCubit = ProfileCubit();
  await profileCubit.initializePreferences();
  runApp(MyApp(profileCubit: profileCubit)); 
}

class MyApp extends StatelessWidget {
  final ProfileCubit profileCubit; 
  const MyApp({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider.value(value: profileCubit), 
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          bool? isDark = cubit.isDark; 
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: isDark ?? false
                ? AppThemes.darkTheme
                : AppThemes.lightTheme,
          );
        },
      ),
    );
  }
}
