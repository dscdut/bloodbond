import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/app.dart';
import 'package:bloodbond/common/constants/locales.dart';
import 'package:bloodbond/configs/app_bloc_observer.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/flavors.dart';
import 'package:bloodbond/generated/codegen_loader.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> mainApp(Flavor flavor) async {
  AppFlavor.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppLocales.en,
        AppLocales.vi,
      ],
      path: AppLocales.path,
      fallbackLocale: AppLocales.vi,
      startLocale: AppLocales.vi,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

Future<void> initializeApp() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await Hive.initFlutter();

  await configureDependencies();

  Bloc.observer = AppBlocObserver();
}
