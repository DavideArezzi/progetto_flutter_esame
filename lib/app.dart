import 'package:flutter/material.dart';
import 'package:progettino_flutter/di/dependency_injector.dart';
import 'package:progettino_flutter/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => DependencyInjector(child: MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerDelegate: _router.delegate(),
    routeInformationParser: _router.defaultRouteParser(),

  ));

}
