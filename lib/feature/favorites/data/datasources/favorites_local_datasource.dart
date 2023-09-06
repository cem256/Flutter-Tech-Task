import 'package:flutter_tech_task/feature/favorites/data/datasources/favorites_cache_client.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

/// [FavoritesLocalDataSource] is a contract class which defines the methods
/// that any implementation of [FavoritesLocalDataSource] must implement.
abstract interface class FavoritesLocalDataSource {
  List<PokemonEntity> getFavorites();
  Future<void> addToFavorites(PokemonEntity item);
  Future<void> removeFromFavorites(int index);
}

final class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  @override
  // Returns a list of [PokemonEntity] from the cache. If the cache is empty,
  // returns an empty list.
  List<PokemonEntity> getFavorites() {
    return _cacheClient.getAll() ?? <PokemonEntity>[];
  }

  @override
  // Adds a [PokemonEntity] to the cache.
  Future<void> addToFavorites(PokemonEntity item) async {
    await _cacheClient.add(item);
  }

  @override
  // Removes a [PokemonEntity] from the cache.
  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
