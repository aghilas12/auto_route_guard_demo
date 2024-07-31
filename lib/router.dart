import 'package:auto_route/auto_route.dart';
import 'package:demo_route_guard/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthService _auth;

  AppRouter(this._auth);

  @override
  List<AutoRouteGuard> get guards => [
        AuthGuard(_auth),
      ];

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          initial: true,
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/blue',
          page: BlueRoute.page,
        ),
        AutoRoute(
          path: '/red',
          page: RedRoute.page,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  final AuthService _auth;

  AuthGuard(this._auth);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_auth.state == AuthState.loggedIn ||
        !_isAuthGuarded(resolver.route.path)) {
      resolver.next();
      return;
    }

    resolver.redirect(
      LoginRoute(onResult: resolver.next),
    );
  }

  bool _isAuthGuarded(String path) => [
        '/red',
      ].contains(path);
}
