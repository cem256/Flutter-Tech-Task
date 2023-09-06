import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

/// [FavoritesRepository] is a contract class which defines the methods
/// that any implementation of [FavoritesRepository] must implement.
abstract interface class FavoritesRepository {
  Either<Failure, List<PokemonEntity>> getFavorites();
  Future<Either<Failure, List<PokemonEntity>>> addOrRemoveItem(PokemonEntity item);
}
