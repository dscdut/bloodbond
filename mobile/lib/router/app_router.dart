import 'package:bloodbond/features/donation_request/view/donation_request.view.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/features/auth/views/login.view.dart';
import 'package:bloodbond/features/core/views/root.view.dart';
import 'package:bloodbond/features/splash/splash.dart';

abstract class AppRouter {
  static const String splash = '/';

  // Auth
  static const String login = '/login';
  static const String register = '/register';

  // Root
  static const String root = '/root';

  // donation request
  static const String donationRequest = '/donation_request';

  // find donors
  static const String findDonors = '/find_donors';

  // static final router = GoRouter(
  //   routes: [
  //     GoRoute(
  //       path: login,
  //       pageBuilder: (_, __) {
  //         return const MaterialPage(
  //           child: LoginPage(),
  //         );
  //       },
  //     ),
  //     GoRoute(
  //       path: register,
  //       pageBuilder: (_, __) {
  //         return const MaterialPage(
  //           child: RegisterView(),
  //         );
  //       },
  //     ),
  //     GoRoute(
  //       path: root,
  //       pageBuilder: (_, __) {
  //         return const MaterialPage(
  //           child: RootPage(),
  //         );
  //       },
  //     )
  //   ],
  //   initialLocation: login,
  // );

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashPage();
          },
        );
      case login:
        return MaterialPageRoute(
          builder: (_) {
            return const LoginPage();
          },
        );
      case root:
        return MaterialPageRoute(
          builder: (_) {
            return const RootPage();
          },
        );
      case donationRequest:
        return MaterialPageRoute(
          builder: (_) {
            return const DonationRequestPage();
          },
        );
      case findDonors:
        return MaterialPageRoute(
          builder: (_) {
            return const FindDonorsPage();
          },
        );
      default:
        return null;
    }
  }
}
