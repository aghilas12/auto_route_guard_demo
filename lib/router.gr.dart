// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [BluePage]
class BlueRoute extends PageRouteInfo<void> {
  const BlueRoute({List<PageRouteInfo>? children})
      : super(
          BlueRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlueRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BluePage();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required void Function(bool) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return LoginScreen(
        key: args.key,
        onResult: args.onResult,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [RedScreen]
class RedRoute extends PageRouteInfo<void> {
  const RedRoute({List<PageRouteInfo>? children})
      : super(
          RedRoute.name,
          initialChildren: children,
        );

  static const String name = 'RedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RedScreen();
    },
  );
}
