import 'package:flutter/material.dart';
import 'package:progettino_flutter/router/app_router.dart';

import 'di/dependency_injector.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => DependecyInjector(child: MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerDelegate: _router.delegate(),
    routeInformationParser: _router.defaultRouteParser(),
  ));
}