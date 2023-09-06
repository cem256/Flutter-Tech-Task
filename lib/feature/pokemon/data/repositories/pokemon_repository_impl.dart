import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tech_task/app/errors/exceptions/exceptions.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';

final class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({required PokemonRemoteDataSource dataSource}) : _dataSource = dataSource;

  final PokemonRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons({required int offset, required int limit}) async {
    try {
      // Get list of [PokemonModel] from the remote data source.
      final response = await _dataSource.getPokemons(offset: offset, limit: limit);
      // Map the list of [PokemonModel] to a list of [PokemonEntity].
      return right(response.map((e) => e.toEntity()).toList());
      // On DioException, return a [NetworkFailure].
    } on DioException {
      return left(NetworkFailure());
      // On NullResponseException, return a [NullResponseFailure].
    } on NullResponseException {
      return left(NullResponseFailure());
      // On any other exception, return a [UnknownFailure] and print the error.
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
