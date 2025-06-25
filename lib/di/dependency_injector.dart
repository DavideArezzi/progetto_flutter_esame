import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:progettino_flutter/repositories/pokedex_repository.dart';
import 'package:provider/provider.dart';

import '../services/pokedex_service.dart';

part 'blocs.dart';
part 'repositories.dart';
part 'providers.dart';

class DependecyInjector extends StatelessWidget {
  const DependecyInjector({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return DependencyInjectorHelper(
      providers: _providers,
      repositories: _repositories,
      blocs: _blocs,
      child: child,
    );
  }
}