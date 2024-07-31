import 'package:auto_route/auto_route.dart';
import 'package:demo_route_guard/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth.dart';

final _auth = AuthCubit();
final _router = AppRouter(_auth);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider.value(
      value: _auth,
      child: MaterialApp.router(
        theme: ThemeData.light(),
        routerConfig: _router.config(
          reevaluateListenable: ReevaluateListenable.stream(_auth.stream),
        ),
      ),
    ),
  );
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      context.router.pushNamed(
                        '/blue',
                        onFailure: (failure) => print,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.blue.shade200),
                    ),
                    child: const Text('Blue'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      context.router.pushNamed(
                        '/red',
                        onFailure: (failure) => print,
                      );
                    },
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red.shade200),),
                    child: const Text('Red'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () => context.read<AuthCubit>().login(),
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.green.shade200),),
                    child: const Text('login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () => context.read<AuthCubit>().logout(),
                    child: const Text('logout'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

@RoutePage()
class BluePage extends StatelessWidget {
  const BluePage({super.key});

  @override
  Widget build(BuildContext context) => Container(color: Colors.blue);
}

@RoutePage()
class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: OutlinedButton(
            onPressed: () => context.read<AuthCubit>().logout(),
            child: const Text('logout'),
          ),
        ),
      );
}

@RoutePage()
class LoginScreen extends StatelessWidget {
  final void Function(bool success) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.green.shade200,
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              context.read<AuthCubit>().login();
              onResult(true);
            },
            child: const Text('login'),
          ),
        ),
      );
}
