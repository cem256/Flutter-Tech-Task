import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(createToJson: false)
class PokemonModel extends Equatable {
  const PokemonModel({
    this.name,
    this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> data) => _$PokemonModelFromJson(data);

  final String? name;
  final String? url;

  @override
  List<Object?> get props => [name, url];

  PokemonEntity toEntity() {
    return PokemonEntity(
      name: name ?? 'Unknown',
      url: url ?? '',
    );
  }
}
