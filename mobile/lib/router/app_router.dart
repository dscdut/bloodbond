import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/features/auth/auth.dart';
import 'package:bloodbond/features/donation_request/donation_request.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';
import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:bloodbond/features/my_form/view/my_form.view.dart';
import 'package:bloodbond/features/my_information/view/my_information.view.dart';
import 'package:bloodbond/features/my_information/widgets/antiNFTCertificates.widget.dart';
import 'package:bloodbond/features/report/view/report.view.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/features/core/views/root.view.dart';
import 'package:bloodbond/features/splash/splash.dart';
import 'package:bloodbond/features/finish_verify/view/finish_verify.view.dart';

abstract class AppRouter {
  static const String splash = '/';

  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String homeScreen = '/home_screen';
  static const String connectWallet = '/connectWallet';
  static const String bloodReport = '/blood_report';
  static const String welcome = '/welcome';
  static const String finish = '/finish_verify';
  static const String forgotPassword = '/forgot_password';

  // Root
  static const String root = '/root';

  // donation request
  static const String donationRequest = '/donation_request';
  static const String createRequest = '/create_request';

  // find donors
  static const String findDonors = '/find_donors';

  // Feature menu
  static const String report = '/report';
  static const String myInformation = '/my_information';
  static const String map = '/map';

  //My Information
  static const String myCertificate = '/my_certificate';
  static const String certificateDetail = '/certificate_detail';
  static const String antiNFTCertificates = '/antiNFT_certificates';
  //My Form
  static const String myForm = 'my_form';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const SplashPage();
          },
        );
      case welcome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const WelcomePage();
          },
        );
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const LoginPage();
          },
        );
      case finish:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const FinishVerifyPage();
          },
        );
      case forgotPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const ForgotPasswordPage();
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
      case myInformation:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const MyInformationPage();
          },
        );

      case myForm:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const MyFormPage();
          },
        );
      case myCertificate:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const MyCertificatePage();
          },
        );
      case certificateDetail:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return CertificateDetail(
              certificate: settings.arguments as NFTModel,
            );
          },
        );
      case createRequest:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const CreateRequestView();
          },
        );
      case antiNFTCertificates:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const AntiNFTCertificates();
          },
        );
      case bloodReport:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const ReportPage();
          },
        );
      default:
        return null;
    }
  }
}
