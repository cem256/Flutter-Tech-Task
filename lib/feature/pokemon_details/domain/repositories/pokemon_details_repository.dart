import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';

/// [PokemonDetailsRepository] is a contract class which defines the methods
/// that any implementation of [PokemonDetailsRepository] must implement.
abstract interface class PokemonDetailsRepository {
  Future<Either<Failure, PokemonDetailEntity>> getPokemonDetails({required String name});
}
