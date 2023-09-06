import 'package:flutter_tech_task/app/constants/cache_constants.dart';
import 'package:flutter_tech_task/core/clients/cache/cache_client_interface.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:hive_flutter/adapters.dart';

/// Cache client for favorites
final class FavoritesCacheClient extends CacheClientInterface<PokemonEntity> {
  @override
  String get boxName => CacheConstants.favoritesBox;

  // Registering adapters for Hive
  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(CacheConstants.pokemonEntityTypeId)) {
      Hive.registerAdapter(PokemonEntityAdapter());
    }
  }
}
