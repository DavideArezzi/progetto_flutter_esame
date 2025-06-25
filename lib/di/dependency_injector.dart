import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';

part 'blocs.dart';
part 'repositories.dart';
part 'providers.dart';

class DependencyInjector extends StatelessWidget {
  const DependencyInjector({super.key, required this.child});

final Widget child;

  @override
  Widget build(BuildContext context) {
    return DependencyInjectorHelper(
      providers: _providers,
      repositories: _repositories,
      blocs: _blocs,
      child: child
    );
  }
}
