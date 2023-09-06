// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_tech_task/feature/favorites/presentation/view/favorites_view.dart'
    as _i1;
import 'package:flutter_tech_task/feature/navbar/view/navbar_view.dart' as _i2;
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
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PokemonDetailsView(),
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
class PokemonDetailsRoute extends _i5.PageRouteInfo<void> {
  const PokemonDetailsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PokemonDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
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
