import 'package:dio/dio.dart';
import 'package:flutter_tech_task/app/constants/endpoint_constants.dart';
import 'package:flutter_tech_task/app/errors/exceptions/exceptions.dart';
import 'package:flutter_tech_task/core/clients/network/network_client.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/models/pokemon_detail/pokemon_detail_model.dart';

/// [PokemonDetailsRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [PokemonDetailsRemoteDataSource] must implement.
abstract interface class PokemonDetailsRemoteDataSource {
  Future<PokemonDetailModel> getPokemonDetails({required String name});
}

final class PokemonDetailsRemoteDataSourceImpl implements PokemonDetailsRemoteDataSource {
  PokemonDetailsRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  // Returns a [PokemonDetailModel] from the remote API.
  Future<PokemonDetailModel> getPokemonDetails({required String name}) async {
    try {
      // Get pokemon details from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(
        '${EndpointConstants.pokemonDetails}$name',
      );
      // If response is null throw [NullResponseException]
      if (response.data == null) {
        throw NullResponseException();
      }
      final pokemonData = response.data!;
      // Map the response to a list of [PokemonDetailModel]
      return PokemonDetailModel.fromJson(pokemonData);
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}
