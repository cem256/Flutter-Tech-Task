// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_tech_task/feature/favorites/presentation/view/favorites_view.dart'
    as _i1;
import 'package:flutter_tech_task/feature/navbar/view/navbar_view.dart' as _i2;
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart'
    as _i6;
import 'package:flutter_tech_task/feature/pokemon/presentation/view/pokemon_view.dart'
    as _i4;
import 'package:flutter_tech_task/feature/pokemon_details/presentation/view/pokemon_details_view.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    FavoritesRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FavoritesView(),
      );
    },
    NavbarRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NavbarView(),
      );
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PokemonDetailsView(
          pokemon: args.pokemon,
          key: args.key,
        ),
      );
    },
    PokemonRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PokemonView(),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoritesView]
class FavoritesRoute extends _i5.PageRouteInfo<void> {
  const FavoritesRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NavbarView]
class NavbarRoute extends _i5.PageRouteInfo<void> {
  const NavbarRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PokemonDetailsView]
class PokemonDetailsRoute extends _i5.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    required _i6.PokemonEntity pokemon,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            pokemon: pokemon,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i5.PageInfo<PokemonDetailsRouteArgs> page =
      _i5.PageInfo<PokemonDetailsRouteArgs>(name);
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    required this.pokemon,
    this.key,
  });

  final _i6.PokemonEntity pokemon;

  final _i7.Key? key;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{pokemon: $pokemon, key: $key}';
  }
}

/// generated route for
/// [_i4.PokemonView]
class PokemonRoute extends _i5.PageRouteInfo<void> {
  const PokemonRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PokemonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
