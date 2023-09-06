import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tech_task/app/errors/exceptions/exceptions.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/datasources/pokemon_details_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/repositories/pokemon_details_repository.dart';

final class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  PokemonDetailsRepositoryImpl({required PokemonDetailsRemoteDataSource dataSource}) : _dataSource = dataSource;

  final PokemonDetailsRemoteDataSource _dataSource;
  @override
  // Gets a [PokemonDetailModel] from remote data source. and returns a [PokemonDetailsEntity] or a [Failure].
  Future<Either<Failure, PokemonDetailEntity>> getPokemonDetails({required String name}) async {
    try {
      // Get a [PokemonDetailModel] from the remote data source.
      final response = await _dataSource.getPokemonDetails(name: name);
      // Convert [PokemonDetailModel] to a [PokemonDetailEntity].
      return right(response.toEntity());
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
