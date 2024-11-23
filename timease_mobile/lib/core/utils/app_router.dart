import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/features/authentication/presentation/views/auth_screen_view.dart';
import 'package:timease_mobile/features/authentication/presentation/views/login_screen_view.dart';
import 'package:timease_mobile/features/authentication/presentation/views/register_screen_view.dart';
import 'package:timease_mobile/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
  static const authScreen='/authScreenView';
  static const loginScreen='/LoginScreenView';
  static const registerScreen='/RegisterScreenView';
  static final  router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: authScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const AuthScreenView();
            },
          ),
          GoRoute(
            path: loginScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreenView();
            },
          ),
          GoRoute(
            path: registerScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterScreenView();
            },
          ),
        ],
      ),
    ],
  );
}