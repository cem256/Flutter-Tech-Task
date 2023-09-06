import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:flutter_tech_task/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

final class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({required FavoritesLocalDataSource dataSource}) : _dataSource = dataSource;

  final FavoritesLocalDataSource _dataSource;

  @override
  // Get all favorites from local cache
  Either<Failure, List<PokemonEntity>> getFavorites() {
    try {
      final favorites = _dataSource.getFavorites();

      return right(favorites);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  // If item is already in favorites, remove it, otherwise add it
  Future<Either<Failure, List<PokemonEntity>>> addOrRemoveItem(PokemonEntity item) async {
    try {
      final favorites = _dataSource.getFavorites();

      if (favorites.contains(item)) {
        final index = favorites.indexOf(item);
        await _dataSource.removeFromFavorites(index);
      } else {
        await _dataSource.addToFavorites(item);
      }
      return right(_dataSource.getFavorites());
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
