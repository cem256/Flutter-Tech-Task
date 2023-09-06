import 'package:dio/dio.dart';
import 'package:flutter_tech_task/core/clients/network/network_client.dart';
import 'package:flutter_tech_task/feature/favorites/data/datasources/favorites_cache_client.dart';
import 'package:flutter_tech_task/feature/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:flutter_tech_task/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:flutter_tech_task/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/feature/favorites/domain/usecases/uc_add_or_remove_favorite.dart';
import 'package:flutter_tech_task/feature/favorites/domain/usecases/uc_get_favorites.dart';
import 'package:flutter_tech_task/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/feature/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/usecases/uc_get_pokemons.dart';
import 'package:flutter_tech_task/feature/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/datasources/pokemon_details_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/repositories/pokemon_details_repository_impl.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/repositories/pokemon_details_repository.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/usecases/uc_get_pokemon_details.dart';
import 'package:flutter_tech_task/feature/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';

import 'package:get_it/get_it.dart';

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  static PokemonListBloc get pokemonListBloc => _instance<PokemonListBloc>();

  static PokemonDetailsCubit get pokemonDetailsCubit => _instance<PokemonDetailsCubit>();

  static FavoritesCubit get favoritesCubit => _instance<FavoritesCubit>();

  static Future<void> locateServices({required String baseUrl}) async {
    // Blocs
    _instance
      ..registerFactory(() => PokemonListBloc(ucGetPokemons: _instance()))
      ..registerFactory(() => PokemonDetailsCubit(ucGetPokemonDetails: _instance()))
      ..registerFactory(() => FavoritesCubit(ucGetFavorites: _instance(), ucAddOrRemoveFavorite: _instance()))

      // Usecases
      ..registerFactory(() => UCGetPokemons(repository: _instance()))
      ..registerFactory(() => UCGetPokemonDetails(repository: _instance()))
      ..registerFactory(() => UCGetFavorites(repository: _instance()))
      ..registerFactory(() => UCAddOrRemoveFavorite(repository: _instance()))

      // Repositories
      ..registerFactory<PokemonRepository>(() => PokemonRepositoryImpl(dataSource: _instance()))
      ..registerFactory<PokemonDetailsRepository>(() => PokemonDetailsRepositoryImpl(dataSource: _instance()))
      ..registerFactory<FavoritesRepository>(() => FavoritesRepositoryImpl(dataSource: _instance()))
      // Data Sources
      ..registerFactory<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImpl(networkClient: _instance()))
      ..registerFactory<PokemonDetailsRemoteDataSource>(
        () => PokemonDetailsRemoteDataSourceImpl(networkClient: _instance()),
      )
      ..registerFactory<FavoritesLocalDataSource>(() => FavoritesLocalDataSourceImpl(cacheClient: _instance()))

      // Clients

      ..registerLazySingleton(() => NetworkClient(dio: _instance(), baseUrl: baseUrl))
      ..registerLazySingleton(FavoritesCacheClient.new)

      // Client Dependencies
      ..registerFactory(Dio.new);

    // Initialize Clients
    await _instance<FavoritesCacheClient>().init();
  }
}
