import 'package:bloodbond/features/auth/auth.dart';
import 'package:bloodbond/features/donation_request/donation_request.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';
import 'package:bloodbond/features/report/view/report.view.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/features/core/views/root.view.dart';
import 'package:bloodbond/features/splash/splash.dart';

abstract class AppRouter {
  static const String splash = '/';

  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String homeScreen = '/home_screen';
  static const String connectWallet = '/connectWallet';

  // Root
  static const String root = '/root';

  // donation request
  static const String donationRequest = '/donation_request';
  static const String createRequest = '/create_request';

  // find donors
  static const String findDonors = '/find_donors';

  // Feature menu
  static const String report = '/report';

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
          settings: settings,
          builder: (_) {
            return const SplashPage();
          },
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const LoginScreenPage();
          },
        );
      case connectWallet:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const ConnectWalletPage();
          },
        );
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const LoginPage();
          },
        );
      case root:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const RootPage();
          },
        );
      case donationRequest:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const DonationRequestPage();
          },
        );
      case findDonors:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const FindDonorsPage();
          },
        );
      case report:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const ReportPage();
          },
        );
      case createRequest:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const CreateRequestView();
          },
        );
      default:
        return null;
    }
  }
}
