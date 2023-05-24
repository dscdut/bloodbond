import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/configs/app_routes.dart';
import 'package:bloodbond/data/repositories/user.repository.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/flavors.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        userRepository: getIt.get<UserRepository>(),
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: AppFlavor.title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // routerConfig: AppRoutes.router,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppRoutes.splash,
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
                      AppRoutes.root,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      (route) => false,
                    );
                    break;
                }
              },
              child: child,
            );
          },
        ),
      ),
    );
  }
}
