import 'package:dio/dio.dart';
import 'package:flutter_tech_task/app/constants/endpoint_constants.dart';
import 'package:flutter_tech_task/app/errors/exceptions/exceptions.dart';
import 'package:flutter_tech_task/core/clients/network/network_client.dart';
import 'package:flutter_tech_task/feature/pokemon/data/models/pokemon/pokemon_model.dart';

/// [PokemonRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [PokemonRemoteDataSource] must implement.
abstract interface class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons({required int offset, required int limit});
}

final class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  // Returns a list of [PokemonModel] from the remote API.
  Future<List<PokemonModel>> getPokemons({required int offset, required int limit}) async {
    try {
      // Get pokemons from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(
        EndpointConstants.pokemon,
        queryParameters: {'offset': offset, 'limit': limit},
      );
      // If response is null or data is null, throw [NullResponseException]
      if (response.data == null || response.data!['results'] == null) {
        throw NullResponseException();
      }
      final pokemonData = response.data!['results'] as List;
      // Map the response to a list of [PokemonModel]
      return pokemonData.map((e) => PokemonModel.fromJson(e as Map<String, dynamic>)).toList();
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}
