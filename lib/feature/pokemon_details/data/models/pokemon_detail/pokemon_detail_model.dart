import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/models/sprites/sprites_model.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/models/stat/stat_model.dart';
import 'package:flutter_tech_task/feature/pokemon_details/data/models/type/type_model.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/sprites/sprites_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/stat/stat_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/type/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class PokemonDetailModel extends Equatable {
  const PokemonDetailModel({
    this.baseExperience,
    this.height,
    this.weight,
    this.sprites,
    this.stats,
    this.types,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> data) => _$PokemonDetailModelFromJson(data);

  @JsonKey(name: 'base_experience')
  final double? baseExperience;
  final double? height;
  final double? weight;
  final SpritesModel? sprites;
  final List<StatModel>? stats;
  final List<TypeModel>? types;

  @override
  List<Object?> get props => [baseExperience, height, weight, sprites, stats, types];

  PokemonDetailEntity toEntity() {
    return PokemonDetailEntity(
      baseExperience: baseExperience ?? 0,
      height: height ?? 0,
      weight: weight ?? 0,
      sprites: sprites?.toEntity() ?? SpritesEntity.initial(),
      stats: stats?.map((e) => e.toEntity()).toList() ?? [StatEntity.initial()],
      types: types?.map((e) => e.toEntity()).toList() ?? [TypeEntity.initial()],
    );
  }
}
