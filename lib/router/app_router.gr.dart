// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:progettino_flutter/ui/pages/detail_pokemon_page.dart' as _i1;
import 'package:progettino_flutter/ui/pages/home_page.dart' as _i2;

/// generated route for
/// [_i1.DetailPokemonPage]
class DetailPokemonRoute extends _i3.PageRouteInfo<DetailPokemonRouteArgs> {
  DetailPokemonRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailPokemonRoute.name,
          args: DetailPokemonRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'DetailPokemonRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailPokemonRouteArgs>();
      return _i3.WrappedRoute(
        child: _i1.DetailPokemonPage(key: args.key, id: args.id),
      );
    },
  );
}

class DetailPokemonRouteArgs {
  const DetailPokemonRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailPokemonRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailPokemonRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i5.Key? key, List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i3.WrappedRoute(child: _i2.HomePage(key: args.key));
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
