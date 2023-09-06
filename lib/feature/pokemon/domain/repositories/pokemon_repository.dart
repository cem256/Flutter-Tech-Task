import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

/// [PokemonRepository] is a contract class which defines the methods
/// that any implementation of [PokemonRepository] must implement.
abstract interface class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemons({required int offset, required int limit});
}
