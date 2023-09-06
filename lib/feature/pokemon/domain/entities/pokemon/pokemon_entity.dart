import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/app/constants/cache_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon_entity.g.dart';

@HiveType(typeId: CacheConstants.pokemonEntityTypeId)
class PokemonEntity extends HiveObject with EquatableMixin {
  PokemonEntity({required this.name, required this.url});

  factory PokemonEntity.initial() => PokemonEntity(name: '', url: '');

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  @override
  List<Object?> get props => [name, url];
}
