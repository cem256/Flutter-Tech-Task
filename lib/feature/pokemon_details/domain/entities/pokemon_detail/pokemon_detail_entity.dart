import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/sprites/sprites_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/stat/stat_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/type/type_entity.dart';

class PokemonDetailEntity extends Equatable {
  const PokemonDetailEntity({
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  final double baseExperience;
  final double height;
  final double weight;
  final SpritesEntity sprites;
  final List<StatEntity> stats;
  final List<TypeEntity> types;

  @override
  List<Object?> get props => [baseExperience, height, weight, sprites, stats, types];
}
