import 'package:dio/dio.dart';
import 'package:flutter_tech_task/core/clients/network/network_client.dart';
import 'package:flutter_tech_task/feature/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/usecases/uc_get_pokemons.dart';
import 'package:flutter_tech_task/feature/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:get_it/get_it.dart';

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  static PokemonListBloc get pokemonListBloc => _instance<PokemonListBloc>();

  static Future<void> locateServices({required String baseUrl}) async {
    // Blocs
    _instance
      ..registerFactory(() => PokemonListBloc(ucGetPokemonns: _instance()))

      // Usecases
      ..registerFactory(() => UCGetPokemonns(repository: _instance()))

      // Repositories
      ..registerFactory<PokemonRepository>(() => PokemonRepositoryImpl(dataSource: _instance()))

      // Data Sources
      ..registerFactory<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImpl(networkClient: _instance()))

      // Clients

      ..registerLazySingleton(() => NetworkClient(dio: _instance(), baseUrl: baseUrl))

      // Client Dependencies
      ..registerFactory(Dio.new);
  }
}