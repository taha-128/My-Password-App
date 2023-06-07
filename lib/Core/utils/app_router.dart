import 'package:go_router/go_router.dart';
import 'package:my_password/Features/Auth/presentation/views/email_verification_view.dart';
import 'package:my_password/Features/Auth/presentation/views/login_view.dart';
import 'package:my_password/Features/Auth/presentation/views/register_view.dart';
import 'package:my_password/Features/Profile/presentation/views/profile_view.dart';
import 'package:my_password/Features/Splash/presentation/views/splash_view.dart';
import '../../Features/Home/presentaion/views/home_view.dart';

abstract class AppRouter {
  static const kVerificationView = '/verificationView';
  static const kRegisterView = '/registerView';
  static const kProfileView = '/aboutView';
  static const kLoginView = '/loginView';
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: ((context, state) => const SplashView()),
      ),
      GoRoute(
        path: kHomeView,
        name: kHomeView,
        builder: ((context, state) => const HomeView()),
      ),
      GoRoute(
        name: kRegisterView,
        path: kRegisterView,
        builder: ((context, state) => const RegisterView()),
      ),
      GoRoute(
        name: kLoginView,
        path: kLoginView,
        builder: ((context, state) => const LoginView()),
      ),
      GoRoute(
        name: kProfileView,
        path: kProfileView,
        builder: ((context, state) => const ProfileView()),
      ),
      GoRoute(
        name: kVerificationView,
        path: kVerificationView,
        builder: ((context, state) => const EmailVerificationView()),
      ),
    ],
  );
}
