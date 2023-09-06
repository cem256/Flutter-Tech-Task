import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

final class UCAddOrRemoveFavorite {
  UCAddOrRemoveFavorite({required FavoritesRepository repository}) : _repository = repository;

  final FavoritesRepository _repository;

  Future<Either<Failure, List<PokemonEntity>>> call(PokemonEntity item) async {
    return _repository.addOrRemoveItem(item);
  }
}
