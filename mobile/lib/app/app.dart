import 'package:bloodbond/common/constants/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:bloodbond/data/repositories/user.repository.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/flavors.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';
import 'package:bloodbond/generated/codegen_loader.g.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        AppLocales.en,
        AppLocales.vi,
      ],
      path: AppLocales.path,
      fallbackLocale: AppLocales.vi,
      startLocale: AppLocales.vi,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: GestureDetector(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Builder(
            builder: (context) {
              return BlocProvider(
                create: (context) => AuthBloc(
                  userRepository: getIt.get<UserRepository>(),
                ),
                child: MaterialApp(
                  navigatorKey: _navigatorKey,
                  title: AppFlavor.title,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  // routerConfig: AppRoutes.router,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                  initialRoute: AppRouter.splash,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  builder: (_, child) {
                    return BlocListener<AuthBloc, AuthState>(
                      listener: (_, state) {
                        switch (state.status) {
                          case AuthenticationStatus.unknown:
                            break;
                          case AuthenticationStatus.authenticated:
                            _navigator.pushNamedAndRemoveUntil(
                              AppRouter.root,
                              (route) => false,
                            );
                            break;
                          case AuthenticationStatus.unauthenticated:
                            _navigator.pushNamedAndRemoveUntil(
                              AppRouter.login,
                              (route) => false,
                            );
                            break;
                        }
                      },
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
